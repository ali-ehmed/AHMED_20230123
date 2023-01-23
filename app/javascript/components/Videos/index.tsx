import React, { useEffect, useState} from 'react';
import { Col, Row } from 'antd';
import { VideoType } from "../../api_types";
import { VideoCardWrapper, VideoCard, VideoPlayer, VideoTitle, VideoCategory } from "./styled";
import Axios from 'axios';

type VideoContentVisibilityType = {
  [id: string]: boolean;
}

export const Videos: React.FC = () => {
  const [videos, setVideos] = useState<VideoType[]>([]);
  const [showContent, setShowContent] = useState<VideoContentVisibilityType>({});
  useEffect(() => {
    const loadVideos = async () => {
      const videosResponse = await Axios.get('api/v1/videos')
      const videosData = videosResponse.data
      setVideos(videosData.data);
    }

    loadVideos();
  }, [])

  const renderVideoCard = (video) => {
    const toggleContent = (id, flag) => {
      setShowContent((prev) => {
        return {
          ...prev,
          [id]: flag
        }
      })
    }

    return (
      <VideoCardWrapper
        onMouseEnter={() => toggleContent(video.id, true)}
        onMouseLeave={() => toggleContent(video.id, false)}
        style={{ position: 'relative' }}
        key={video.id}
      >
        <VideoCard>
          <VideoPlayer
            width={300}
            controls
            poster={video.attributes.videoClipThumbnail}
          >
            <source
              src={video.attributes.videoClipUrl}
              type={video.attributes.videoClipContentType}
            />
          </VideoPlayer>
          {
            showContent[video.id] && (
              <>
                <VideoTitle>{video.attributes.title}</VideoTitle>
                <VideoCategory>{video.attributes.category.name}</VideoCategory>
              </>
            )
          }
        </VideoCard>
      </VideoCardWrapper>
    )
  }

  return (
    <>
      <h1>Videos List</h1>
      <Row justify={'space-between'}>
        {
          videos.map((videoItem) => {
            return (
              <Col span={7}>{renderVideoCard(videoItem)}</Col>
            )
          })
        }
      </Row>
    </>
  )
}
