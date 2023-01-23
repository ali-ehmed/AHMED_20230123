import styled from "styled-components";
import { Card } from "antd";

export const VideoCardWrapper = styled.div`
  position: relative;
`;

export const VideoCard = styled(Card)`
  padding-bottom: 65px;
  border: none;
  .ant-card-body {
    padding: 0;
  }
`;

export const VideoPlayer = styled.video``;

export const VideoTitle = styled.div`
  font-size: 18px;
  font-weight: 400;
`;

export const VideoCategory = styled.div`
  font-size: 14px;
`;
