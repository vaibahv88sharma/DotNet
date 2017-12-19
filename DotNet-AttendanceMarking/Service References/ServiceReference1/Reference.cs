﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AttendanceMarking.ServiceReference1 {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Util.ResultObject", Namespace="http://schemas.datacontract.org/2004/07/BKIWCFService")]
    [System.SerializableAttribute()]
    public partial class UtilResultObject : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private System.Data.DataTable DtField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ErrorMessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string ExceptionMessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string InnerExceptionMessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string MessageField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string NameField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private object ObjField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private bool StatusField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Data.DataTable Dt {
            get {
                return this.DtField;
            }
            set {
                if ((object.ReferenceEquals(this.DtField, value) != true)) {
                    this.DtField = value;
                    this.RaisePropertyChanged("Dt");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ErrorMessage {
            get {
                return this.ErrorMessageField;
            }
            set {
                if ((object.ReferenceEquals(this.ErrorMessageField, value) != true)) {
                    this.ErrorMessageField = value;
                    this.RaisePropertyChanged("ErrorMessage");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ExceptionMessage {
            get {
                return this.ExceptionMessageField;
            }
            set {
                if ((object.ReferenceEquals(this.ExceptionMessageField, value) != true)) {
                    this.ExceptionMessageField = value;
                    this.RaisePropertyChanged("ExceptionMessage");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string InnerExceptionMessage {
            get {
                return this.InnerExceptionMessageField;
            }
            set {
                if ((object.ReferenceEquals(this.InnerExceptionMessageField, value) != true)) {
                    this.InnerExceptionMessageField = value;
                    this.RaisePropertyChanged("InnerExceptionMessage");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Message {
            get {
                return this.MessageField;
            }
            set {
                if ((object.ReferenceEquals(this.MessageField, value) != true)) {
                    this.MessageField = value;
                    this.RaisePropertyChanged("Message");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Name {
            get {
                return this.NameField;
            }
            set {
                if ((object.ReferenceEquals(this.NameField, value) != true)) {
                    this.NameField = value;
                    this.RaisePropertyChanged("Name");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public object Obj {
            get {
                return this.ObjField;
            }
            set {
                if ((object.ReferenceEquals(this.ObjField, value) != true)) {
                    this.ObjField = value;
                    this.RaisePropertyChanged("Obj");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public bool Status {
            get {
                return this.StatusField;
            }
            set {
                if ((this.StatusField.Equals(value) != true)) {
                    this.StatusField = value;
                    this.RaisePropertyChanged("Status");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference1.IStudentAttendance")]
    public interface IStudentAttendance {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStudentAttendance/CreateHEATTicket", ReplyAction="http://tempuri.org/IStudentAttendance/CreateHEATTicketResponse")]
        AttendanceMarking.ServiceReference1.UtilResultObject CreateHEATTicket(string wsClientUsername, string wsClientPassword, string staffLoginName, string staffNumber, string CRN, string teamCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStudentAttendance/CreateHEATTicket", ReplyAction="http://tempuri.org/IStudentAttendance/CreateHEATTicketResponse")]
        System.Threading.Tasks.Task<AttendanceMarking.ServiceReference1.UtilResultObject> CreateHEATTicketAsync(string wsClientUsername, string wsClientPassword, string staffLoginName, string staffNumber, string CRN, string teamCode);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStudentAttendance/UpdateHEATTicketStatus", ReplyAction="http://tempuri.org/IStudentAttendance/UpdateHEATTicketStatusResponse")]
        AttendanceMarking.ServiceReference1.UtilResultObject UpdateHEATTicketStatus(string wsClientUsername, string wsClientPassword, string ServiceReqNumb);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStudentAttendance/UpdateHEATTicketStatus", ReplyAction="http://tempuri.org/IStudentAttendance/UpdateHEATTicketStatusResponse")]
        System.Threading.Tasks.Task<AttendanceMarking.ServiceReference1.UtilResultObject> UpdateHEATTicketStatusAsync(string wsClientUsername, string wsClientPassword, string ServiceReqNumb);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IStudentAttendanceChannel : AttendanceMarking.ServiceReference1.IStudentAttendance, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class StudentAttendanceClient : System.ServiceModel.ClientBase<AttendanceMarking.ServiceReference1.IStudentAttendance>, AttendanceMarking.ServiceReference1.IStudentAttendance {
        
        public StudentAttendanceClient() {
        }
        
        public StudentAttendanceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public StudentAttendanceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public StudentAttendanceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public StudentAttendanceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public AttendanceMarking.ServiceReference1.UtilResultObject CreateHEATTicket(string wsClientUsername, string wsClientPassword, string staffLoginName, string staffNumber, string CRN, string teamCode) {
            return base.Channel.CreateHEATTicket(wsClientUsername, wsClientPassword, staffLoginName, staffNumber, CRN, teamCode);
        }
        
        public System.Threading.Tasks.Task<AttendanceMarking.ServiceReference1.UtilResultObject> CreateHEATTicketAsync(string wsClientUsername, string wsClientPassword, string staffLoginName, string staffNumber, string CRN, string teamCode) {
            return base.Channel.CreateHEATTicketAsync(wsClientUsername, wsClientPassword, staffLoginName, staffNumber, CRN, teamCode);
        }
        
        public AttendanceMarking.ServiceReference1.UtilResultObject UpdateHEATTicketStatus(string wsClientUsername, string wsClientPassword, string ServiceReqNumb) {
            return base.Channel.UpdateHEATTicketStatus(wsClientUsername, wsClientPassword, ServiceReqNumb);
        }
        
        public System.Threading.Tasks.Task<AttendanceMarking.ServiceReference1.UtilResultObject> UpdateHEATTicketStatusAsync(string wsClientUsername, string wsClientPassword, string ServiceReqNumb) {
            return base.Channel.UpdateHEATTicketStatusAsync(wsClientUsername, wsClientPassword, ServiceReqNumb);
        }
    }
}
