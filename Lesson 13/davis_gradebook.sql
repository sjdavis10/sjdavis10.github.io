PGDMP      .        
        }           Gradebook_Davis    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16386    Gradebook_Davis    DATABASE     �   CREATE DATABASE "Gradebook_Davis" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 !   DROP DATABASE "Gradebook_Davis";
                     postgres    false            �            1259    16395    assignments    TABLE     �   CREATE TABLE public.assignments (
    assignment_id integer NOT NULL,
    title character varying(100),
    description text,
    due_date date,
    student_id integer,
    grade character varying(10)
);
    DROP TABLE public.assignments;
       public         heap r       postgres    false            �            1259    16394    assignments_assignment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assignments_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.assignments_assignment_id_seq;
       public               postgres    false    220            �           0    0    assignments_assignment_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.assignments_assignment_id_seq OWNED BY public.assignments.assignment_id;
          public               postgres    false    219            Z           2604    16398    assignments assignment_id    DEFAULT     �   ALTER TABLE ONLY public.assignments ALTER COLUMN assignment_id SET DEFAULT nextval('public.assignments_assignment_id_seq'::regclass);
 H   ALTER TABLE public.assignments ALTER COLUMN assignment_id DROP DEFAULT;
       public               postgres    false    219    220    220            �          0    16395    assignments 
   TABLE DATA           e   COPY public.assignments (assignment_id, title, description, due_date, student_id, grade) FROM stdin;
    public               postgres    false    220   �       �           0    0    assignments_assignment_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.assignments_assignment_id_seq', 1, true);
          public               postgres    false    219            \           2606    16402    assignments assignments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (assignment_id);
 F   ALTER TABLE ONLY public.assignments DROP CONSTRAINT assignments_pkey;
       public                 postgres    false    220            ]           2606    16403 '   assignments assignments_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(student_id);
 Q   ALTER TABLE ONLY public.assignments DROP CONSTRAINT assignments_student_id_fkey;
       public               postgres    false    220            �   h   x��A
�0�uz��
�%dPܺI�0�M;$�����H�{7����F�8�?����[Am&�P�]��E,kM��'oq����l�y��a�C\(��	�Bx y"�     