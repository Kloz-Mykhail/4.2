export interface BackSetFields {
  created: string;
  edited: string;
  url: string;
}
export interface ID {
  id: number;
}
export interface Ok {
  ok: true;
}
export interface PagOpt {
  offset: number;
  count: number;
}
export interface Rel<T> {
  relations: T;
}
export type RIDRes<R> = Record<keyof R, ID[]>;
export type SRes<R> = Omit<Record<keyof R, string[]>, 'files'>;
export type DiscRes<D> = D & BackSetFields & ID;
