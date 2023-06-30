import * as React from 'react';

type Props = {
  initialCount?: number;
};

export const Counter = (props: Props) => {
  const [count, setCount] = React.useState(props.initialCount ?? 0);

  return <button onClick={() => setCount((count) => count + 1)}>count is {count}</button>;
};
