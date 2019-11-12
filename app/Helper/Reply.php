<?php

    namespace App\Helper;

    use Illuminate\Contracts\Validation\Validator;
    use Carbon\Carbon;
    class Reply
    {

        /** Return success response
         * @param $message
         * @return array
         */
        public static function success($message) {
            return [
                "status" => "success",
                "message" => Reply::getTranslated($message)
            ];
        }

        public static function successWithData($message, $data) {
            $response = Reply::success($message);

            return array_merge($response, $data);
        }

        /** Return error response
         * @param $message
         * @return array
         */
        public static function error($message, $error_name = null, $errorData = []) {
            return [
                "status" => "fail",
                "error_name" => $error_name,
                "data" => $errorData,
                "message" => Reply::getTranslated($message)
            ];
        }

        /** Return validation errors
         * @param \Illuminate\Validation\Validator|Validator $validator
         * @return array
         */
        public static function formErrors($validator) {
            return [
                "status" => "fail",
                "errors" => $validator->getMessageBag()->toArray()
            ];
        }

        /** Response with redirect action. This is meant for ajax responses and is not meant for direct redirecting
         * to the page
         * @param $url string to redirect to
         * @param null $message Optional message
         * @return array
         */
        public static function redirect($url, $message = null) {
            if ($message) {
                return [
                    "status" => "success",
                    "message" => Reply::getTranslated($message),
                    "action" => "redirect",
                    "url" => $url
                ];
            }
            else {
                return [
                    "status" => "success",
                    "action" => "redirect",
                    "url" => $url
                ];
            }
        }

        private static function getTranslated($message) {
            $trans = trans($message);

            if ($trans == $message) {
                return $message;
            }
            else {
                return $trans;
            }
        }


        public static function dataOnly($data) {
            return $data;
        }
        public static function showData($id_value,$current_satus){
            $view=array();
            $view['due_date']= 'is_due_date';
            $view['project_phase']= 'is_project_phase';
            $view['project']= 'is_project';
            $view['start_date']= 'is_start_date';
            $view['end_date']= 'is_end_date';
            $view['task_cat']= 'is_task_cat';
            $view['pro_cat']= 'is_project_cat';
            $view['est_hour']= 'is_est_hour';
            $view['act_hour']= 'is_act_hour';
            $view['created_at']= 'is_created_at';
            $view['selection_tiles']= 'is_section_tiles';
            $view['tags']= 'is_tag';
            if($current_satus==0){
                $c=1;
            }else{
                $c=0;
            }
            $name=$view[$id_value];
            return [
                'changed_status'=>$c,
                'name'=>$name
            ];

        }
        public static function measure_due($date){
            $today = Carbon::today();
            $today = $today->format('Y-m-d');
            $color=['red','yellow', 'green'];
            if($today>$date){
                $level=$color[0];
            }elseif($today=$date){
                $level=$color[2];
            }else{
                $level=$color[2];
            }
            return $level;


        }
        public static function idFiler($id_string){
            $task='';
            $sub_task='';
            $sub_pos=strpos($id_string,'sub');
            for($i=0;$i<strlen($id_string);$i++){
                if($i>3 && $i<$sub_pos){
                    $task.=$id_string[$i];
                }
                if($i>$sub_pos+6){
                    $sub_task.=$id_string[$i];
                }
            }
            if(is_numeric($task)==false || is_numeric($sub_task)==false){
                return 'matul';
            }
            $task_id=(int)$task;
            $sub_id=(int)$sub_task;
            return ['task_id'=>$task_id,'sub_id'=>$sub_id];
        }

    }