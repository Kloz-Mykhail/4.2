export interface BackSetFields {
  created: Date;
  edited: Date;
  url: string;
}
export interface ID {
  id: number;
}
export interface Ok {
  ok: boolean;
}
export interface PagOpt {
  offset: number;
  count: number;
}
export interface Rel<T> {
  relations: T;
}
export interface URL {
  url: string;
}
export type RIDRes<R> = Record<keyof R, number[]>;
export type SRes<R> = Omit<Record<keyof R, string[]>, 'files'>;
export type DiscRes<D> = D & BackSetFields & ID;
