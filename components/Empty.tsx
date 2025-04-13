import Image from 'next/image';

export default function Empty({ title }: { title: string }) {
  return (
    <div className='flex flex-col items-center gap-1'>
      <Image src='/images/search-empty.png' alt='empty' width={100} height={100} className='max-w-[100px]' />
      <span className='whitespace-pre-wrap text-center text-sm text-white/40'>{title}</span>
    </div>
  );
}
