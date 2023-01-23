import { CategoryType } from "./category";

export type VideoType = {
  id: string;
  attributes: {
    title: string;
    category: CategoryType;
    videoClipUrl: string;
    videoClipContentType: string;
    videoClipThumbnail: string;
  };
};
