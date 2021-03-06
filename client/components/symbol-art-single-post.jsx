import React from 'react';
import { LazyLoadImage } from 'react-lazy-load-image-component';
import { Link } from 'react-router-dom';
import { apiDownloadPostFromId, pathUserFromUserId } from '../lib/endpoints';
import AppContext from '../lib/app-context';
import sounds from '../lib/sound-catalog.json';
import PlaceholderImage from './placeholder-image';
import Tag from './tag';

/**
 * @param {object} props
 * @property props.symbolArt - Symbol Art data from fetch request.
 */
export default function SinglePostSymbolArt(props) {
  const { playSound } = React.useContext(AppContext);

  const {
    postId,
    title,
    description,
    fileThumbnailUrl,
    tags,
    username,
    userId,
    filePropsSound,
    filePropsName,
    filePropsLayerCount
  } = props.symbolArt;

  const downloadLink = apiDownloadPostFromId(postId);
  const userLink = pathUserFromUserId(userId);

  const handleShareLink = () => {
    navigator.clipboard.writeText(window.location.href);
  };

  return (
    <div className="grid-item rounded-box mx-auto flex h-fit max-w-2xl flex-col gap-8 bg-base-100 p-4">
      <div className="flex flex-col gap-4">
        <LazyLoadImage
          className="rounded-box aspect-[2/1] w-full select-none"
          src={fileThumbnailUrl}
          placeholder={<PlaceholderImage />}
        />
        <div className="flex justify-between">
          <div className="flex flex-col gap-2">
            <div className="flex items-center gap-2 break-all rounded-full bg-base-300 px-4 py-1 text-lg font-semibold">
              <span className="material-icons text-md select-none">
                description
              </span>
              {filePropsName}
            </div>
            <div className="text-md flex w-fit items-center gap-2 break-words rounded-full bg-base-300 px-4 font-semibold">
              <span className="material-icons text-md select-none">layers</span>
              {filePropsLayerCount} Layers
            </div>
          </div>
          {
            // prettier-ignore
            filePropsSound > 1
              ? (
            <button
              className="btn btn-outline btn-sm gap-2 rounded-full text-lg font-bold"
              onClick={e => playSound(filePropsSound)}>
              <span className="material-icons text-md">volume_up</span>
              {sounds[filePropsSound].name}
            </button>
                )
              : null
          }{' '}
        </div>
      </div>
      <div className="flex flex-col gap-2">
        <h3 className="break-words break-all text-4xl font-bold ">{title}</h3>
        <Link to={userLink}>
          <h4 className="link-hover text-xl font-semibold">@{username}</h4>
        </Link>
        <p className="text-lg">{description}</p>
      </div>
      <ul className="flex flex-wrap gap-2">
        {tags &&
          tags.map((tag, id) => {
            if (tag === '') return '';
            return <Tag key={id} tag={tag} />;
          })}
      </ul>
      <div className="grid grid-cols-2 gap-4">
        <button
          onClick={handleShareLink}
          className="btn btn-accent btn-md flex w-full gap-2 px-2 text-xl ">
          <span className="hidden sm:block">Copy Link</span>
          <span className="material-icons text-2xl">link</span>
        </button>
        <a
          href={downloadLink}
          className="btn btn-secondary btn-md w-full items-center gap-2 px-2 text-xl">
          <span className="hidden sm:block">Download</span>
          <span className="material-icons text-2xl">file_download</span>
        </a>
      </div>
    </div>
  );
}
