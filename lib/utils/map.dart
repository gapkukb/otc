T? merge<T extends Map<String, dynamic>>(T? o1, T? o2) {
  if (o1 == null && o2 == null) return null;
  if (o1 == null) return o2;
  if (o2 == null) return o1;
  o1.addAll(o2);
  return o1;
}
