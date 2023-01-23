import React, {useEffect, useState} from 'react';
import { Button, Form, Input, Select, notification } from "antd";
import { SectionHeader } from "../../styled";
import { useNavigate } from "react-router-dom";
import Axios from 'axios';
import { CategoryType } from "../../../api_types";

export const NewVideo: React.FC = () => {
  const [categories, setCategories] = useState<CategoryType[]>([]);
  const navigate = useNavigate();
  const [form] = Form.useForm();
  const [disableSubmit, setDisableSubmit] = useState(false);
  const [selectedFile, setSelectedFile] = useState(null);
  const csRFToken = document
    .querySelector('[name=csrf-token]')
    ?.getAttribute('content');

  useEffect(() => {
    const loadCategories = async () => {
      const categoriesResponse = await Axios.get('/api/v1/categories')
      const categoriesData = categoriesResponse.data
      setCategories(categoriesData.data);
    }

    loadCategories();
  }, [])

  const categorySelectOptions = categories?.map((category) => {
    return { value: category.id, label: category.attributes.name }
  })

  const handleSubmit = async (values) => {
    const formData = new FormData();
    if (values.title) formData.append('title', values.title);
    if (values.category) formData.append('category_id', values.category);
    if (selectedFile) {
      formData.append("clip", selectedFile);
    }

    try {
      setDisableSubmit(true);
      await Axios({
        method: "POST",
        url: "/api/v1/videos",
        data: formData,
        headers: {
          'X-CSRF-TOKEN': csRFToken,
        },
      });
      notification.info({
        message: `Video was uploaded successfully`,
      });
      navigate('/');
    } catch(error) {
      setDisableSubmit(false);
      notification.error({
        message: `Error while uploading video `,
        description: error.response.data.errors,
      });
    }
  }

  const handleFileSelect = (event) => {
    setSelectedFile(event.target.files[0])
  }

  return (
    <>
      <SectionHeader>
        <h1>Upload a new video</h1>
        <Button type='link' onClick={() => navigate('/videos')}>Go Back</Button>
      </SectionHeader>

      <Form
        form={form}
        name="candidateInfoForm"
        layout={'vertical'}
        autoComplete="off"
        onFinish={handleSubmit}
      >
        <Form.Item
          label="Title"
          name="title"
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="Category"
          name="category"
        >
          <Select
            options={categorySelectOptions}
          />
        </Form.Item>

        <div style={{ marginBottom: '24px' }}>
          <input type="file" onChange={handleFileSelect}/>
        </div>

        <Form.Item>
          <Button disabled={disableSubmit} type="primary" htmlType="submit">
            Submit
          </Button>
        </Form.Item>
      </Form>
    </>
  )
}
