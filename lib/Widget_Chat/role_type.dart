import 'package:flutter/material.dart';
import 'package:commit_me/design/color_system.dart';

class RoleType extends StatefulWidget {
  final TextEditingController controller;  // ✅ 외부에서 컨트롤러 주입

  RoleType({Key? key, required this.controller}) : super(key: key);

  @override
  State<RoleType> createState() => _RoleTypeState();
}

class _RoleTypeState extends State<RoleType> {
  bool isRoleNone = true; // "선택안함" 초기 선택
  bool isRole1 = false; // 자기소개서/이력서 중심형
  bool isRole2 = false; // 친절하고 유도적인 서포터 유형
  bool isRole3 = false; // 압박형
  bool isRole4 = false; // 사실 확인형
  bool isRole5 = false; // 비즈니스 실무 중심형
  bool isRole6 = false; // 반응이 없는 유형

  @override
  void initState() {
    super.initState();
    isRole1 = true;  // ✅ 자기소개서/이력서 중심형 버튼 선택
    widget.controller.text = '자기소개서/이력서 중심형'; // ✅ 텍스트 필드에 기본 텍스트 설정
  }

  void selectRole(String roleType) {
    setState(() {
      // 현재 선택 상태를 기억하기 위해 임시 저장
      bool wasSelected = false;

      // 현재 어떤 역할이 선택되었는지 확인
      switch (roleType) {
        case "none":
          wasSelected = isRoleNone;
          break;
        case "role1":
          wasSelected = isRole1;
          break;
        case "role2":
          wasSelected = isRole2;
          break;
        case "role3":
          wasSelected = isRole3;
          break;
        case "role4":
          wasSelected = isRole4;
          break;
        case "role5":
          wasSelected = isRole5;
          break;
        case "role6":
          wasSelected = isRole6;
          break;
      }

      // 모든 역할 초기화
      isRoleNone = false;
      isRole1 = false;
      isRole2 = false;
      isRole3 = false;
      isRole4 = false;
      isRole5 = false;
      isRole6 = false;

      // 이전에 선택된 상태가 아니면 선택, 이미 선택된 상태면 선택안함으로
      if (!wasSelected) {
        switch (roleType) {
          case "none":
            isRoleNone = true;
            widget.controller.text = '';
            break;
          case "role1":
            isRole1 = true;
            widget.controller.text = '자기소개서/이력서 중심형';
            break;
          case "role2":
            isRole2 = true;
            widget.controller.text = '친절하고 유도적인 서포터형';
            break;
          case "role3":
            isRole3 = true;
            widget.controller.text = '압박형';
            break;
          case "role4":
            isRole4 = true;
            widget.controller.text = '사실확인형';
            break;
          case "role5":
            isRole5 = true;
            widget.controller.text = '비즈니스 실무 중심형';
            break;
          case "role6":
            isRole6 = true;
            widget.controller.text = '반응이 없는 유도형';
            break;
        }
      } else {
        isRoleNone = true;
        widget.controller.text = '';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("면접관 유형", style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text("면접관 유형을 선택해, 다양한 상황에 맞춤형 연습을 해보세요",
          style: TextStyle(fontSize: 13, color: Colors.grey),),
        SizedBox(height: 10,),
        InterviewRoleButton(
          label: '자기소개서/이력서 중심형',
          roleKey: 'role1',
          isSelected: isRole1,
          onTap: selectRole,
        ), SizedBox(height: 8,),
        InterviewRoleButton(
          label: '친절하고 유도적인 서포터형',
          roleKey: 'role2',
          isSelected: isRole2,
          onTap: selectRole,
        ), SizedBox(height: 8,),
        InterviewRoleButton(
          label: '압박형',
          roleKey: 'role3',
          isSelected: isRole3,
          onTap: selectRole,
        ), SizedBox(height: 8,),
        InterviewRoleButton(
          label: '사실확인형',
          roleKey: 'role4',
          isSelected: isRole4,
          onTap: selectRole,
        ), SizedBox(height: 8,),
        InterviewRoleButton(
          label: '비즈니스 실무 중심형',
          roleKey: 'role5',
          isSelected: isRole5,
          onTap: selectRole,
        ), SizedBox(height: 8,),
        InterviewRoleButton(
          label: '반응이 없는 유도형',
          roleKey: 'role6',
          isSelected: isRole6,
          onTap: selectRole,
        ),

      ],
    );
  }
}


class InterviewRoleButton extends StatelessWidget {
  final String label;
  final String roleKey;
  final bool isSelected;
  final Function(String) onTap;

  const InterviewRoleButton({
    required this.label,
    required this.roleKey,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: SizedBox(
        width: 450, // 원하는 너비로 설정
        child: ElevatedButton(
          onPressed: () => onTap(roleKey),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(250, 37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? Colors.transparent : AppColors.backBlue,
                width: 1,
              ),
            ),
            backgroundColor: isSelected ? AppColors.DarkBlue : Colors.white,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}