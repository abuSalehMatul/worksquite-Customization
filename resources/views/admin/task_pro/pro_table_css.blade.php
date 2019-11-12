{{-- <script src="{{ asset('plugins/bower_components/jquery/dist/jquery.min.js') }}"></script> --}}

<style>
  .dropdown-submenu {
  position: relative;
  
}
.dropdown-menu{
    left: -100% !important;
}
.dropdown-submenu .dropdown-menu {
  top: 0;
  right: 10%;
  margin-top: -1px;
}
.dropdown-menu-two{
     position: relative;
     right: 80%;
     background: white;
}
.md-3{
    width: 6%;
    float: left;
}

.container-fluid {
    padding-left: 5px !important;
    padding-right: 5px !important;
    padding-bottom: 5px !important;
}
.top-bar-select{
    color:black !important;
    background: white;
    font-weight: 600;
    cursor: pointer;
    padding: 5px;
}
.task-details-matul{
    margin: 5px;
    padding: 15px;
    background: white;
    color: black;
    font-size: 17px;
    font-weight: 500;
}
.task-details-matul tr td{
    padding:15px;
}

.recurrence{
    position: absolute;
    z-index: 100;
    background: white;
    border:1px solid black;
    padding:5px;
}
.select-recurrence-option{
    border: 1px solid gainsboro;
    outline: 2px;
    border-radius: 2%;
    
}
#top-div{
    background: blue;
    padding:5px
}
#top-div h5{
    font-weight: 600;
    color:white;

}
#cross-and-cancel{
    float: right;
    color: white;
    font-size: 15px;
}
.recurrence-input{
    width: 60%;
    padding:5px;
}
.option-div{
    position: relative;
    left: 0;
    border-right: 1px solid gainsboro;
}
.show-option{
    position: relative;
    left: 35%;
    bottom: 109px;
}
.bottom-div{
 border: 1px solid gainsboro;
    border-radius: 2%;
}
.show-option-bottom{
   
    position: relative;
    left: 35%;
    bottom: 40px;
}
/* Hover tooltips */
.field-tip {
    position:relative;
    cursor:help;
}
    .field-tip .tip-content {
        position:absolute;
        top:-10px; /* - top padding */
        right:9999px;
        width:200px;
        margin-right:-220px; /* width + left/right padding */
        padding:10px;
        color:#fff;
        background:#333;
        -webkit-box-shadow:2px 2px 5px #aaa;
           -moz-box-shadow:2px 2px 5px #aaa;
                box-shadow:2px 2px 5px #aaa;
        opacity:0;
        -webkit-transition:opacity 250ms ease-out;
           -moz-transition:opacity 250ms ease-out;
            -ms-transition:opacity 250ms ease-out;
             -o-transition:opacity 250ms ease-out;
                transition:opacity 250ms ease-out;
    }
        /* <http://css-tricks.com/snippets/css/css-triangle/> */
        .field-tip .tip-content:before {
            content:' '; /* Must have content to display */
            position:absolute;
            top:50%;
            left:-16px; /* 2 x border width */
            width:0;
            height:0;
            margin-top:-8px; /* - border width */
            border:8px solid transparent;
            border-right-color:#333;
        }
        .field-tip:hover .tip-content {
            right:-20px;
            opacity:1;
        }
.dropdown {
  position: relative;
  display: inline-block;
}
.project-selector{
    width: 30%;
    height: -2%;
    padding: 20px;
    position: absolute;
    left: 30%;
    top: 34%;
    opacity: .9;
    z-index: 174;
    background: lightseagreen;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}
.fa-sort-up{
    position: relative;
    left: 8px;
   
    padding: 4px;
}
.fa-sort-down{
    position: relative;
    right: 4px;
   
}
.middling_popup{
    border: solid 1px black;
    position: fixed;
    left: 50%;
    top: 30%;
    background-color: white;
    z-index: 100;
    height: 400px;
    margin-top: -200px;

    width: 600px;
    margin-left: -300px;
}
.middling_popup_re{
    border: solid 1px black;
    position: fixed;
    left: 50%;
    top: 30%;
    background-color: white;
    z-index: 100;
    height: 400px;
    margin-top: -200px;

    width: 1032px;
    margin-left: -300px;
}
select 
{
    -webkit-appearance: none;
}
.dropdown-content li:hover{
    padding:4px;
    font-size: 14px;
} 



 .green-arrow {
     background: greenyellow !important;
     color: white;
 }



 .ul-nav-item{
         padding: 3px;
    position: relative;
 }

 thead input {
     width: 80%;
     padding: 1px;
     box-sizing: border-box;
 }

 div.container {
     width: 70%;
 }
 .fas{
     font-size: 12px !important;

 }
 .fa{
     font-size: 12px !important;
 }
 .green{
     color: greenyellow;
 }

 .table.dataTable thead>tr>th.sorting_asc,
 table.dataTable thead>tr>th.sorting_desc,
 table.dataTable thead>tr>th.sorting,
 table.dataTable thead>tr>td.sorting_asc,
 table.dataTable thead>tr>td.sorting_desc,
 table.dataTable thead>tr>td.sorting {
     padding-right: 9px;
 }

 .table>tbody>tr>td,
 .table>tbody>tr>th,
 .table>tfoot>tr>td,
 .table>tfoot>tr>th,
 .table>thead>tr>td,
 .table>thead>tr>th {
     padding: 9px 6px;
 }

 th i.sort-by {
     padding-right: 18px;
     position: relative;
 }

 i.sort-by:before,
 i.sort-by:after {
     border: 4px solid transparent;
     content: "";
     display: block;
     height: 0;
     right: 5px;
     top: 50%;
     position: absolute;
     width: 0;
 }

 i.sort-by:before {
     border-bottom-color: #666;
     margin-top: -9px;
 }

 i.sort-by:after {
     border-top-color: #666;
     margin-top: 1px;
 }
 .showall{
    position: relative;
    left: -20%;
    width: 120%;
    right: 0;
    z-index: 100;
    box-shadow: 1px 1px 1px 1px grey;
    overflow-y: scroll;
 }
 .status{
    padding: 4px;
    border-radius: 20%;
    color: white;
    font-weight: 600;
 }
 .top-task{
         position: relative;
    /* right: -7%; */
    left: 36%;

 }
 .pro_phase{
     font-weight: 600;
     color: #666;
     font-style: italic;
 }
 .create-task{
     font-style: oblique;
     color:gainsboro;
     font-weight: 400;
 }
 .task-heading{
     color:skyblue;
     font-style: italic;
 }
 @media (max-width: 692px) {
     .col-md-11 {
         width: 88.666667%;
     }
     .top-task{
             position: relative;
    /* right: -7%; */
    left: 1%;

     }
 }












/* Utility styles
************************************************/
.vgt-right-align {
  text-align: right;
}
.vgt-left-align {
  text-align: left;
}
.vgt-center-align {
  text-align: center;
}
.vgt-pull-left {
  float: left !important;
}
.vgt-pull-right {
  float: right !important;
}
.vgt-clearfix::after {
  display: block;
  content: "";
  clear: both;
}
.vgt-responsive {
  width: 100%;
  overflow-x: auto;
  position: relative;
}
.vgt-text-disabled {
  color: #909399;
}
.vgt-wrap {
  position: relative;
}
.vgt-fixed-header {
  position: absolute;
  z-index: 10;
  width: 100%;
  overflow-x: auto;
}
.dragging_tr{
  font-size: 12px;
  background-color: white;
  width: 100%;
  max-width: 100%;
  vertical-align: middle;
  padding: 0.7em 0.7em 0.7em 0.7em;
  color: #606266;
  opacity: 1;
  border-radius: 9%;
  cursor: pointer;
}
.dragging_tr td{
  padding:1px 10px;
}
table.vgt-table {
  font-size: 16px;
  border-collapse: collapse;
  background-color: white;
  width: 100%;
  max-width: 100%;
  table-layout: auto;
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
}
table.vgt-table td {
  padding: 0.75em 0.75em 0.75em 0.75em;
  color: #606266;
}
table.vgt-table tr.clickable {
  cursor: pointer;
}
table.vgt-table tr.clickable:hover {
  background-color: #F1F5FD;
}
.vgt-table th {
  padding: 0.75em 1.5em 0.75em 0.75em;
  vertical-align: middle;
  position: relative;
}
.vgt-table th.sorting {
  cursor: pointer;
}
.vgt-table th.sorting:after {
  content: "";
  display: none;
  position: absolute;
  height: 0px;
  width: 0px;
  right: 6px;
  top: 50%;
  margin-top: -3px;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: 6px solid #409eff;
}
.vgt-table th.sorting:hover:after {
  display: inline-block;
  border-bottom-color: #73b8ff;
}
.vgt-table th.line-numbers, .vgt-table th.vgt-checkbox-col {
  padding: 0 0 0.75em 0 0.75em;
  color: #606266;
  word-wrap: break-word;
  text-align: center;
  background: linear-gradient(#F4F5F8, #F1F3F6);
}
.vgt-table th.filter-th {
  padding: 0.75em 0.75em 0.75em 0.75em;
}
.vgt-table th.vgt-row-header {
  border-bottom: 2px solid #DCDFE6;
  border-top: 2px solid #DCDFE6;
}
.vgt-table thead th {
  color: #606266;
  vertical-align: bottom;
  padding-right: 1.5em;
  background: linear-gradient(#F4F5F8, #F1F3F6);
}
.vgt-table thead th.vgt-checkbox-col {
  vertical-align: middle;
  width: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  padding-top: 1.5rem;
}
.vgt-table thead th.sorting-asc, .vgt-table thead th.sorting-desc {
  color: #3b3c3f;
}
.vgt-table thead th.sorting-asc:after, .vgt-table thead th.sorting-desc:after {
  content: "";
  display: block;
}
.vgt-table thead th.sorting-desc:after {
  border-top: 6px solid #409eff;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: none;
}
.vgt-input, .vgt-select {
  width: 100%;
  height: 32px;
  line-height: 1;
  display: block;
  font-size: 14px;
  font-weight: normal;
  padding: 6px 12px;
  color: #606266;
  border-radius: 4px;
  box-sizing: border-box;
  background-image: none;
  background-color: #fff;
  border: 1px solid #DCDFE6;
  transition: border-color 0.2s cubic-bezier(0.645, 0.045, 0.355, 1);
}
.vgt-input::-webkit-input-placeholder, .vgt-select::-webkit-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #606266;
  opacity: 0.3;
  /* Firefox */
}
.vgt-input::-moz-placeholder, .vgt-select::-moz-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #606266;
  opacity: 0.3;
  /* Firefox */
}
.vgt-input:-ms-input-placeholder, .vgt-select:-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #606266;
  opacity: 0.3;
  /* Firefox */
}
.vgt-input::-ms-input-placeholder, .vgt-select::-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #606266;
  opacity: 0.3;
  /* Firefox */
}
.vgt-input::placeholder, .vgt-select::placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #606266;
  opacity: 0.3;
  /* Firefox */
}
.vgt-input:focus, .vgt-select:focus {
  outline: none;
  border-color: #409eff;
}
.vgt-loading {
  position: absolute;
  width: 100%;
  z-index: 10;
  margin-top: 117px;
}
.vgt-loading__content {
  background-color: #c0dfff;
  color: #409eff;
  padding: 7px 30px;
  border-radius: 3px;
}
.vgt-inner-wrap.is-loading {
  opacity: 0.5;
  pointer-events: none;
}
.vgt-table.striped tbody tr:nth-of-type(odd) {
  background-color: rgba(51, 68, 109, 0.03);
}
.vgt-wrap.rtl {
  direction: rtl;
}
.vgt-wrap.rtl .vgt-table td, .vgt-wrap.rtl .vgt-table th:not(.line-numbers) {
  padding: 0.75em 0.75em 0.75em 1.5em;
}
.vgt-wrap.rtl .vgt-table thead th, .vgt-wrap.rtl .vgt-table.condensed thead th {
  padding-left: 1.5em;
  padding-right: 0.75em;
}
.vgt-wrap.rtl .vgt-table th.sorting:after,
.vgt-wrap.rtl .vgt-table th.sorting-asc:after {
  margin-right: 5px;
  margin-left: 0px;
}
.vgt-table.condensed td, .vgt-table.condensed th.vgt-row-header {
  padding: 0.4em 0.4em 0.4em 0.4em;
}
.vgt-global-search {
  padding: 5px 0px;
  display: flex;
  flex-wrap: nowrap;
  align-items: stretch;
  border-bottom: 0px;
  background: linear-gradient(#F4F5F8, #F1F3F6);
}
.vgt-global-search__input {
  position: relative;
  padding-left: 40px;
  flex-grow: 1;
}
.vgt-global-search__input .input__icon {
  position: absolute;
  left: 0px;
  max-width: 32px;
}
.vgt-global-search__input .input__icon .magnifying-glass {
  margin-top: 3px;
  margin-left: 8px;
  display: block;
  width: 16px;
  height: 16px;
  border: 2px solid #d6dae2;
  position: relative;
  border-radius: 50%;
}
.vgt-global-search__input .input__icon .magnifying-glass:before {
  content: "";
  display: block;
  position: absolute;
  right: -7px;
  bottom: -5px;
  background: #d6dae2;
  width: 8px;
  height: 4px;
  border-radius: 2px;
  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
}
.vgt-global-search__actions {
  margin-left: 10px;
}
.vgt-selection-info-row {
  background: #fdf9e8;
  padding: 5px 16px;
  font-size: 13px;
  border-top: 1px solid #DCDFE6;
  border-left: 1px solid #DCDFE6;
  border-right: 1px solid #DCDFE6;
  color: #d3aa3b;
  font-weight: bold;
}
.vgt-selection-info-row a {
  font-weight: bold;
  display: inline-block;
  margin-left: 10px;
}
.vgt-wrap__actions-footer {
  border: 1px solid #DCDFE6;
}
.vgt-wrap__footer {
  color: #606266;
  padding: 1em;
}
.vgt-wrap__footer .footer__row-count__label, .vgt-wrap__footer .footer__row-count__select {
  display: inline-block;
  vertical-align: middle;
}
.vgt-wrap__footer .footer__row-count__label {
  font-size: 14px;
  color: #909399;
}
.vgt-wrap__footer .footer__row-count__select {
  background-color: transparent;
  width: auto;
  padding: 0;
  border: 0;
  border-radius: 0;
  height: auto;
  font-size: 14px;
  margin-left: 8px;
  color: #606266;
  font-weight: bold;
}
.vgt-wrap__footer .footer__row-count__select:focus {
  outline: none;
  border-color: #409eff;
}
.vgt-wrap__footer .footer__navigation {
  font-size: 14px;
}
.vgt-wrap__footer .footer__navigation__page-btn, .vgt-wrap__footer .footer__navigation__info, .vgt-wrap__footer .footer__navigation__page-info {
  display: inline-block;
  vertical-align: middle;
}
.vgt-wrap__footer .footer__navigation__page-btn {
  text-decoration: none;
  color: #606266;
  font-weight: bold;
  white-space: nowrap;
}
.vgt-wrap__footer .footer__navigation__page-btn:focus {
  outline: none;
  border: 0;
}
.vgt-wrap__footer .footer__navigation__page-btn.disabled, .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover {
  opacity: 0.5;
  cursor: not-allowed;
}
.vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.left:after, .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.left:after {
  border-right-color: #606266;
}
.vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.right:after, .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.right:after {
  border-left-color: #606266;
}
.vgt-wrap__footer .footer__navigation__page-btn .chevron {
  width: 24px;
  height: 24px;
  border-radius: 15%;
  position: relative;
  margin: 0px 8px;
}
.vgt-wrap__footer .footer__navigation__page-btn .chevron:after {
  content: "";
  position: absolute;
  display: block;
  left: 50%;
  top: 50%;
  margin-top: -6px;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
}
.vgt-wrap__footer .footer__navigation__page-btn .chevron.left::after {
  border-right: 6px solid #409eff;
  margin-left: -3px;
}
.vgt-wrap__footer .footer__navigation__page-btn .chevron.right::after {
  border-left: 6px solid #409eff;
  margin-left: -3px;
}
.vgt-wrap__footer .footer__navigation__info, .vgt-wrap__footer .footer__navigation__page-info {
  display: inline-block;
  color: #909399;
  margin: 0px 16px;
}
.vgt-wrap__footer .footer__navigation__page-info__current-entry {
  width: 30px;
  text-align: center;
  display: inline-block;
  margin: 0px 10px;
  font-weight: bold;
}
@media only screen and (max-width: 750px) {
  /* on small screens hide the info */
.vgt-wrap__footer .footer__navigation__info {
    display: none;
}
.vgt-wrap__footer .footer__navigation__page-btn {
    margin-left: 16px;
}
}
.vgt-table.nocturnal {
  border: 1px solid #435169;
  background-color: #324057;
}
.vgt-table.nocturnal tr.clickable:hover {
  background-color: #445168;
}
.vgt-table.nocturnal td {
  border-bottom: 1px solid #435169;
  color: #C7CED8;
}
.vgt-table.nocturnal th.line-numbers, .vgt-table.nocturnal th.vgt-checkbox-col {
  color: #C7CED8;
  background: linear-gradient(#2C394F, #2C394F);
}
.vgt-table.nocturnal thead th {
  color: #C7CED8;
  border-bottom: 1px solid #435169;
  background: linear-gradient(#2C394F, #2C394F);
}
.vgt-table.nocturnal thead th.sorting-asc, .vgt-table.nocturnal thead th.sorting-desc {
  color: #9aa7b9;
}
.vgt-table.nocturnal.bordered td, .vgt-table.nocturnal.bordered th {
  border: 1px solid #435169;
}
.vgt-table.nocturnal .vgt-input, .vgt-table.nocturnal .vgt-select {
  color: #C7CED8;
  background-color: #232d3f;
  border: 1px solid #435169;
}
.vgt-table.nocturnal .vgt-input::-webkit-input-placeholder, .vgt-table.nocturnal .vgt-select::-webkit-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.nocturnal .vgt-input::-moz-placeholder, .vgt-table.nocturnal .vgt-select::-moz-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.nocturnal .vgt-input:-ms-input-placeholder, .vgt-table.nocturnal .vgt-select:-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.nocturnal .vgt-input::-ms-input-placeholder, .vgt-table.nocturnal .vgt-select::-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.nocturnal .vgt-input::placeholder, .vgt-table.nocturnal .vgt-select::placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.nocturnal .vgt-wrap__footer {
  color: #C7CED8;
  border: 1px solid #435169;
  background: linear-gradient(#2C394F, #2C394F);
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__row-count__label {
  color: #8290A7;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__row-count__select {
  color: #C7CED8;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__row-count__select:focus {
  border-color: #409eff;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-btn {
  color: #C7CED8;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.left:after, .vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.left:after {
  border-right-color: #C7CED8;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.right:after, .vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.right:after {
  border-left-color: #C7CED8;
}
.vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__info, .vgt-wrap.nocturnal .vgt-wrap__footer .footer__navigation__page-info {
  color: #8290A7;
}
.vgt-wrap.nocturnal .vgt-global-search {
  border: 1px solid #435169;
  background: linear-gradient(#2C394F, #2C394F);
}
.vgt-wrap.nocturnal .vgt-global-search__input .input__icon .magnifying-glass {
  border: 2px solid #3f4c63;
}
.vgt-wrap.nocturnal .vgt-global-search__input .input__icon .magnifying-glass:before {
  background: #3f4c63;
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select {
  color: #C7CED8;
  background-color: #232d3f;
  border: 1px solid #435169;
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input::-webkit-input-placeholder, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select::-webkit-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input::-moz-placeholder, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select::-moz-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input:-ms-input-placeholder, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select:-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input::-ms-input-placeholder, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select::-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.nocturnal .vgt-global-search__input .vgt-input::placeholder, .vgt-wrap.nocturnal .vgt-global-search__input .vgt-select::placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #C7CED8;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.black-rhino {
  border: 1px solid #435169;
  background-color: #dfe5ee;
}
.vgt-table.black-rhino tr.clickable:hover {
  background-color: #fff;
}
.vgt-table.black-rhino td {
  border-bottom: 1px solid #bbc5d6;
  color: #49515e;
}
.vgt-table.black-rhino th.line-numbers, .vgt-table.black-rhino th.vgt-checkbox-col {
  color: #dae2f0;
  border-right: 1px solid #435169;
  background: linear-gradient(#4c5c79, #4e5d7c);
}
.vgt-table.black-rhino thead th {
  color: #dae2f0;
  text-shadow: 1px 1px #3e5170;
  border-bottom: 1px solid #435169;
  background: linear-gradient(#4c5c79, #4e5d7c);
}
.vgt-table.black-rhino thead th.sorting-asc, .vgt-table.black-rhino thead th.sorting-desc {
  color: white;
}
.vgt-table.black-rhino.bordered td {
  border: 1px solid #bbc5d6;
}
.vgt-table.black-rhino.bordered th {
  border: 1px solid #435169;
}
.vgt-table.black-rhino .vgt-input, .vgt-table.black-rhino .vgt-select {
  color: #dae2f0;
  background-color: #34445f;
  border: 1px solid transparent;
}
.vgt-table.black-rhino .vgt-input::-webkit-input-placeholder, .vgt-table.black-rhino .vgt-select::-webkit-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.black-rhino .vgt-input::-moz-placeholder, .vgt-table.black-rhino .vgt-select::-moz-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.black-rhino .vgt-input:-ms-input-placeholder, .vgt-table.black-rhino .vgt-select:-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.black-rhino .vgt-input::-ms-input-placeholder, .vgt-table.black-rhino .vgt-select::-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-table.black-rhino .vgt-input::placeholder, .vgt-table.black-rhino .vgt-select::placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.black-rhino .vgt-wrap__footer {
  color: #dae2f0;
  border: 1px solid #435169;
  background: linear-gradient(#4c5c79, #4e5d7c);
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count {
  position: relative;
  padding-right: 3px;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count__label {
  color: #98a5b9;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count__select {
  color: #49515e;
  background: #dfe5ee;
  border: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  padding-right: 15px;
  padding-left: 5px;
  border-radius: 3px;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count__select::-ms-expand {
  display: none;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count__select:focus {
  border-color: #409eff;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__row-count::after {
  content: "";
  display: block;
  position: absolute;
  height: 0px;
  width: 0px;
  right: 6px;
  top: 50%;
  margin-top: -1px;
  border-top: 6px solid #49515e;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-bottom: none;
  pointer-events: none;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-btn {
  color: #dae2f0;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.left:after, .vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.left:after {
  border-right-color: #dae2f0;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-btn.disabled .chevron.right:after, .vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-btn.disabled:hover .chevron.right:after {
  border-left-color: #dae2f0;
}
.vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__info, .vgt-wrap.black-rhino .vgt-wrap__footer .footer__navigation__page-info {
  color: #dae2f0;
}
.vgt-wrap.black-rhino .vgt-global-search {
  border: 1px solid #435169;
  background: linear-gradient(#4c5c79, #4e5d7c);
}
.vgt-wrap.black-rhino .vgt-global-search__input .input__icon .magnifying-glass {
  border: 2px solid #3f4c63;
}
.vgt-wrap.black-rhino .vgt-global-search__input .input__icon .magnifying-glass:before {
  background: #3f4c63;
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select {
  color: #dae2f0;
  background-color: #44516c;
  border: 1px solid transparent;
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input::-webkit-input-placeholder, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select::-webkit-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input::-moz-placeholder, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select::-moz-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input:-ms-input-placeholder, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select:-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input::-ms-input-placeholder, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select::-ms-input-placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.vgt-wrap.black-rhino .vgt-global-search__input .vgt-input::placeholder, .vgt-wrap.black-rhino .vgt-global-search__input .vgt-select::placeholder {
  /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: #dae2f0;
  opacity: 0.3;
  /* Firefox */
}
.drag {
  display: contents;
}
.tasks {
  display: contents;
}
.drag tr {
  border-bottom: solid 1px #DCDFE6;
}
.drag tr:hover {
  background-color: #f7fafc !important;
}
td .form-control:focus {
  border-color: #66afe9 !important;
  outline: 0 !important;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(102, 175, 233, 0.6) !important;
}
td .form-control {
  border-radius: 0.25rem;
}
.edit_complete {
  font-size: 20px;
  color: #2ca9de;
}
.edit_complete:hover {
  color: #337ab7;
}
.Status {
  letter-spacing: 0.05em;
  border-radius: 60px;
  padding: 4px 12px 3px;
  font-weight: 500;
  display: inline;
  padding: 0.2em 0.6em 0.3em;
  font-size: 75%;
  font-weight: 700;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
}
.Status-incomplete {
  background-color: #d21010;
}
span div {
  opacity: 0;
  transition: all 500ms ease-in-out;
}
span img:hover + div {
  opacity: 1;
}
.Status-complete {
  background-color: #679c0d;
}





</style>

 <link rel="stylesheet" href="{{ asset('plugins/bower_components/bootstrap-select/bootstrap-select.min.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css') }}">
<link rel="stylesheet" href="{{ asset('plugins/bower_components/custom-select/custom-select.css') }}"> 
