import 'package:dart_tiktok/constants/sizes.dart';
import 'package:flutter/material.dart';

class VideoNavButton extends StatefulWidget {
  final Function onTap;

  const VideoNavButton({
    super.key,
    required this.onTap,
  });

  @override
  State<VideoNavButton> createState() => _VideoNavButtonState();
}

class _VideoNavButtonState extends State<VideoNavButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: Sizes.size6,
              child: Container(
                width: Sizes.size48,
                height: Sizes.size40,
                decoration: BoxDecoration(
                  color: const Color(0xff61D4F0),
                  borderRadius: BorderRadius.circular(Sizes.size10),
                ),
              ),
            ),
            Positioned(
              left: Sizes.size6,
              child: Container(
                width: Sizes.size48,
                height: Sizes.size40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Sizes.size10),
                ),
              ),
            ),
            Container(
              width: Sizes.size48,
              height: Sizes.size40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
위 코드는 VideoNavButton 위젯을 정의하고, 해당 버튼을 탭할 때 애니메이션을 적용하는데 사용하는 것을 보여줍니다. 아래는 애니메이션과 관련된 부분에 대한 상세 설명입니다.

_scale 변수:

_scale은 애니메이션으로 버튼 크기를 조절하기 위한 변수입니다. _controller.value를 사용하여 버튼의 크기를 변경하게 됩니다.
_controller 변수:

_controller는 AnimationController입니다. 이 컨트롤러를 사용하여 애니메이션을 관리합니다.
vsync는 SingleTickerProviderStateMixin를 사용하여 컨트롤러에게 화면 업데이트를 동기화하도록 합니다.
duration은 애니메이션 지속 시간을 설정합니다.
lowerBound와 upperBound는 애니메이션의 최소 및 최대 값 범위를 설정합니다.
initState 메서드:

_controller를 초기화하고, 애니메이션의 변화에 따라 화면을 다시 그리기 위해 addListener를 사용합니다.
dispose 메서드:

_controller를 화면이 소멸될 때 정리하기 위해 dispose 메서드를 사용합니다.
_tapDown 메서드:

GestureDetector의 onTapDown 콜백 함수로, 버튼이 눌릴 때 호출됩니다. _controller를 통해 애니메이션을 시작합니다.
_tapUp 메서드:

GestureDetector의 onTapUp 콜백 함수로, 버튼이 눌렸다가 떼질 때 호출됩니다. _controller를 통해 애니메이션을 역으로 진행하고, 버튼이 떼진 후 widget.onTap()을 호출하여 사용자 지정 onTap 함수를 실행합니다.

Transform.scale 위젯:
_scale 값을 변경하여 버튼의 크기를 조절합니다. 이로써 버튼이 눌릴 때 확대/축소 애니메이션 효과를 만듭니다.

이렇게 설계된 코드는 버튼이 눌렸을 때 약간의 확대/축소 애니메이션을 적용하여 사용자에게 피드백을 제공하는 기능을 제공합니다.

_tapDown 및 _tapUp 메서드입니다. 이러한 메서드들은 사용자가 버튼을 누르거나 버튼에서 손을 떼는 동작을 감지하고 이에 따라 애니메이션을 제어합니다.

_tapDown 메서드:

_tapDown 메서드는 사용자가 버튼을 누를 때 호출됩니다. TapDownDetails를 인자로 받아와서 사용자의 터치 이벤트에 대한 세부 정보를 포함합니다.
_controller.forward() 메서드를 호출하여 애니메이션을 시작합니다. 이로써 버튼이 눌렸을 때 애니메이션은 앞으로 진행되어 확대됩니다.
_tapUp 메서드:

_tapUp 메서드는 사용자가 버튼에서 손을 뗄 때 호출됩니다. TapUpDetails를 인자로 받아와서 사용자의 터치 이벤트에 대한 세부 정보를 포함합니다.
_controller.reverse() 메서드를 호출하여 애니메이션을 역으로 진행시키고, 버튼에서 손을 뗀 후 버튼의 크기를 축소시킵니다.
이렇게 함으로써 사용자가 버튼을 누르면 확대 애니메이션이 시작되고, 버튼에서 손을 뗄 때 애니메이션은 역으로 진행되어 버튼이 원래 크기로 돌아갑니다. 이것이 버튼을 누를 때 확대/축소 애니메이션을 만드는 핵심 로직입니다.






*/