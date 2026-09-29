Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390751B183
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687388; cv=none; b=Ye6Diq2U86IvfqEWs8XEXgPkKs1HQX9nLVFhYWMCGz/2TGYIIiXZcI84KIgkg/SXIAp1tAYPLiyZXKn553AjXKAMt69XM1x2wyFfujvW1Nah0l4UKCwSgwFNbKn+t+Un8ubEnIxtMsDy9EE1PEeK4vzr/4MJ7iQ+8sha0o04Czk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687388; c=relaxed/simple;
	bh=vB3F+GrFSsJFsCj1zdfhKmxnlVYkLjmMEKrzHcTKtQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kw3KKOQOXVmssd5oi9C+BTtnsoTL4S/bCTlAYPz4t8slLRfvCIHi849pIHsKJZPy8+nMuUGew191uwZg8JXC8U/4BeAfR0cCCyIPcRhcg1WVxX+X0xW3ZHRpe0hrLcx+oCIFfspTiv4OgaWATBXHPJ6+83bGRGmWr0LLSQBv2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgeRBI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Awbvho8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgeRBI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Awbvho8T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCvuDO3300571
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P5/6VkAAW56MNBgPb8smRt
	9B2s8Z/+Z0hyZq9f3fgtM=; b=kKgeRBI8Fkflt7HtrG2FRFt+vLzM2wTUqg0op4
	Gxq6cxpN7AkxJfUSd1HueO87jgiimiqucUl3vU02Ri4vvxoo61n9Vwlv0v+ILMPs
	ePeZVAjyElBMDVr13KlEIpYEYIC+NkAd03iPGv2DED9ews1p8UOOVgKJgnGq6uHg
	kUvEMNaJMRwKGcJhHWz9B8cGbSgjvY+7Dx7SNxyw8D7CkbZeOA+jm6J2axhTJsZ4
	T9eqlEg1ln3mOEeeNQoeO6mcJl5hKjqtraEH1+B8pKVSHFNwajo5GiE9UnfveNp5
	egD+bTQSGOCnHEsGKjUxt5hOwOBUM2tQEf10G/crcPm/j4LQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx026y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91064f6e75bso112010426d6.3
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687385; x=1791292185; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P5/6VkAAW56MNBgPb8smRt9B2s8Z/+Z0hyZq9f3fgtM=;
        b=Awbvho8TcZqQ6JC/ZhpCyS0+fnl3Md8zUlYq0qI88JTlvopvSOSkgy+IUi/Bchj42Q
         KEWe3yFrQS5QmyvmkcmEnN9dxN8PJB6oYh1crOy02iCa2ON6Qx0/layz5Xzd99gYZ8Oj
         l08k7yol9YHRdsloa6ljgexQ1jHNuOFETnIO+KOqCZoj7ZRKiIrgV7yZyPm+mdYjNHge
         JhXtPryz6i05YMPHlg73frXQ5j5dFG3+OTBnGcbQj4hYGdonbaXRkPz/Glo9BnrY8yHL
         sH2SO1WXtG8JeFwt8jTi5xJhwzxmeVL91zpXWTGXCIl5y6vZc7EWeTJRq1rvteXxp4ln
         p9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687385; x=1791292185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5/6VkAAW56MNBgPb8smRt9B2s8Z/+Z0hyZq9f3fgtM=;
        b=PvS5nlQ/ZugW+TcEK7nICFOUmF6TwxiBLypHdiD7RkZDbpY/xtPMmjGrAl61ybqSht
         CQiPOFeGFpJZy7rrDEJd5DzOWb/Dr2wwFjGYb/jRdgMmwJV5ygvFzLaClOdeVgfw3i2l
         E8MpFDzlgKOQCN0buOZtB5hWxFrFDLXaQnwNtF+Ho/XGhIm7JW52j8+inQskEEr1vgDh
         46hcgNQ7MOBy4FFhY+rBc1j0UepPtywtdR9h0kHo+RxqIugMPxFCo3K0vNQ97ixGX1xK
         1sAS7dhlNw7okr/tKW5oY9WZbHpy15VpK5D9AEz+GtaiUrdS9r1LBdZlBwRlXiRmo6fB
         ZRIw==
X-Forwarded-Encrypted: i=1; AKwUvBzgHkslZ93T3Iyxwynd71B5COCYlKy585Y00bZg3/v73+HxWgmiRtPlnIavQizCbMlb9xg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLhnsv5yMqBRJdhEJB3TLEPkvNw8NXxdQHmLfuR94Sq2LUP1HHy
	7/xEwYd8Yqt55CUdflB3hSMGhyOCWitRqiC7zEaSwX2eNqRumuC7rIeF/ccFv4fI4MAZFfn3qpO
	tJt6v1O3+71bCoHIHTwojXznlCA3wnfaefjPXL/MvLHL1x9eOE9Dqnsg=
X-Gm-Gg: AYBFou2XiRg9sTBQqKhcq7O1+2fHiNTokC7sWWWhCkzvqALb5wEuj7BGdbsglKUnLDB
	KM9I4COijzomM1lQGBjUyG6aqEKtYS9ZI08kU264nzEohUxBq970wvaRv2nYBOU1qRZG4GTUscK
	SUO9e431A6WEYnhdmlj+xXpoZ8AgauM89KCVPMyNAm7xOrSkUTKx+p6zOkVun5R9rrROtoqMGBJ
	uF5fM4l6f0k/6OSQCsK87U6/+XIehPa1ekXokX3A7ULCPENAe7E60/DqxMKOAxxMcjga79cuolt
	RcQDY0AuOG/Gq57K9JvkrycFNO1ffGouP/d230qoEaclAc8SadQdNYu4lN5syqmxmfHDDT3xmrf
	vQBcwN2gKDZEx7fdKjlQgdcGlC6cXnz3CEhY=
X-Received: by 2002:a05:6214:501a:b0:914:4cfc:38a4 with SMTP id 6a1803df08f44-9144cfc3ee4mr179847446d6.25.1790687385058;
        Tue, 29 Sep 2026 06:09:45 -0700 (PDT)
X-Received: by 2002:a05:6214:501a:b0:914:4cfc:38a4 with SMTP id 6a1803df08f44-9144cfc3ee4mr179846776d6.25.1790687384439;
        Tue, 29 Sep 2026 06:09:44 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:43 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH v3 00/12] hwmon: Add Qualcomm SPMI BCL driver
Date: Tue, 29 Sep 2026 18:39:32 +0530
Message-Id: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIy4u2oC/23PTWrDMBAF4KsYraswmtiSmlXvUbrQz7gWxFYsO
 W5CyN07iReFtpuBN0gf826iUklUxaG5iUJrqilPHPYvjQiDmz5JpshZIKAGgyDnkEfpw1EOX2O
 epI4aMKjXjpwX/OlUqE+XJ/j+wXlIdcnl+vRX9dhuFIL+Ta1KgjS+Rd2DN8apt1zrbj67I78bd
 zzEQ1zxRzGIfxRkpSdPaKEjZfw/yn07tNB85sLLdq04uSUMXPfQqOj3SNoET8FGqywRRWi5qwX
 EVrWIJmLsWLp/A+J1YRtCAQAA
X-Change-ID: 20260720-qcom-bcl-hwmon-6d602c195eab
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=5889;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vB3F+GrFSsJFsCj1zdfhKmxnlVYkLjmMEKrzHcTKtQ8=;
 b=jNIo1xD7PbwnTZjn+7rWYsDmjDaDLyiyi8f7zs9mlePmKf7tgZHbEP9aufZ5PkpXZRzY6VvYp
 uBgn4BiyQBVA1D53U+ZPlufQ1eN5otXJhYe0OwMYWWi1WLsM8HaFcU0
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX+rA40PuPVlR+
 Ehus3VsqyqBKt7sE3zR+6b62ZugJ3U0rZ4hniVJxWw3H6878mDkeYFEn8hahCUk0h8td2pY5bET
 ywDnrDcmwkANgmji14BpcL/0yy7paM8NZkCdlYOm7xmSbUjEnZoZCWpIQj8HYKy8VaXwaIsx8S8
 WYsFAcrdKwSFjsi1oTZEj8Wdh/vGOTiVskpPrr1d76cGPWMJ+ygOSKZNYwErifZYZ3aMIFZBS1T
 BpyrzoUtF2VtFto3AJ5ZfzxDgJ6yflFt0TRVJjY7O9urx4QbFDwbvGlrGICxxY8OOBNCJd0zg+e
 OSlZKFoHPp4+yfkFrgaYmsMUvlzlXJG8XnBDfsXeNBFlxYa8kWKN7S4MpF9/vjZYNIxzdpOjI9+
 3cOvaTa/1wImCtHr5nEEf1c/w/Ka9i087HiR19eqGfuIQOz07FgmoHxAbwhkkagTRy/Om8nkH1L
 NavB6GG/zrDy08DizRA==
X-Proofpoint-ORIG-GUID: igonWwNJRFFEjN7Bbd-dvVi0g0VW9Hu9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzlLWmEgoX8/+
 +B8Gz9A/yn/sM+AccuXC+KP3E2AZgJfiyLzRTvwxhu1xv1tbEdCj+onL95LXO0Ux37NFi497uPF
 ygnsB0tSkLqwdBCoWE27srO7ERl+cJY=
X-Proofpoint-GUID: igonWwNJRFFEjN7Bbd-dvVi0g0VW9Hu9
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbb89a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=EUspDBNiAAAA:8 a=S1ockVxmnWB0F84MHPgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

This series introduces support for the Qualcomm SPMI PMIC Battery Current
Limiting (BCL) hardware monitor present in various Qualcomm PMICs.

The BCL hardware ensures robust battery protection by monitoring battery
conditions in real time and triggering interrupts when predefined
thresholds are crossed. These alerts allow the system to respond
proactively, preventing battery degradation and preserving system
reliability under adverse power conditions.

The driver integrates with the standard hwmon subsystem, exposing battery
measurements and configurable alarm thresholds. This design enables
seamless integration with existing system monitoring tools and thermal
management frameworks.

Key features:
- Battery/system under voltage and over current monitoring support
- Real-time voltage and current readings support
- Configurable threshold-based alarms (warning, critical and emergency)
- Interrupt-driven notifications for threshold violations
- Automatic threshold management with polling-based recovery
- Hardware-specific scaling factors and threshold representations

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Dependencies:
- This series depends on the following patch, which is currently present
  in linux-next but is not yet in the mainline tree:
  https://lore.kernel.org/all/20260813211433.879638-1-linux@roeck-us.net/

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Changes in v3:
- Rebased series and added 3rd alarm (emergency limit alarm) support for all PMICs
- Used static hwmon info building instead of dynamic info (Guenter)
- Removed unnecessary generic labels sysfs (Guenter)
- Renamed struct bcl_channel_cfg fields with _mu suffix for clarity
- Removed linux/mod_devicetable.h include (Uwe)
- Fixed uninitialized cache timestamps (sashiko ai)
- Fixed Integer truncation in threshold writes(sashiko ai)
- Fixed Missing data_field_bits_size in pmh0101_data (sashiko ai)
- Fixed DIV_ROUND_CLOSEST 32-bit architecture issue (sashiko ai)
- Fixed CHANNEL_CURR max_mu values using correct formula
- Fixed critical teardown race conditions
- Added device tree nodes for PM7550 and PM7550BA on Eliza platform
- Link to v2: https://lore.kernel.org/r/20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com

Changes in v2:
- Reworked the binding from the generic qcom,bcl-hwmon.yaml schema to a
  PMIC-specific qcom,pm7250b-bcl.yaml schema using exact compatible strings.(Krzysztof)
- Dropped the DT-configured overcurrent-thresholds-milliamp property.(Konrad)
- Renamed interrupt names from "bcl-max-min"/"bcl-critical" to
  "max-min"/"critical".(Krzysztof)
- Limited the binding and driver match table to the supported PMICs:
  PM7250B, PM8350C, PM8550, PMH0101, PMIH0108, SMB2360 and SMB2370.(Daniel)
- Folded qcom-bcl-hwmon.h into qcom-bcl-hwmon.c and removed the
  macro-generated alarm mapping helpers.(Krzysztof/Bjorn/Daniel)
- Reworked the driver around per-PMIC register descriptors instead of
  generic BCL generation/mode descriptors.(Krzysztof/Bjorn)
- Added support for 16-bit voltage/current input registers and
  SMB2360/SMB2370 2S/3S battery configuration based scaling.
- Build hwmon channel information dynamically from hardware enable state
  instead of registering static voltage/current channel sets.(Daniel)
- Improved alarm IRQ handling with per-alarm locking, wake state tracking,
  shutdown guards, and explicit delayed-work cleanup.
- Switched probe/error paths to dev_err_probe() and tightened BCL enable,
  regmap-field, and hwmon registration handling.
- Link to v1: https://lore.kernel.org/r/20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com

---
Manaf Meethalavalappu Pallikunhi (12):
      dt-bindings: hwmon: Describe Qualcomm BCL hardware
      hwmon: Add Qualcomm PMIC BCL driver
      arm64: dts: qcom: hamoa-pmic: Enable BCL sensor node
      arm64: dts: qcom: pm7250b: Enable BCL sensor node
      arm64: dts: qcom: pm7550-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm7550ba-eliza: Enable BCL sensor node
      arm64: dts: qcom: pm8350c: Enable BCL sensor node
      arm64: dts: qcom: pm8550: Enable BCL sensor node
      arm64: dts: qcom: pmh0101: Enable BCL sensor node
      arm64: dts: qcom: pmih0108-kaanapali: Enable BCL sensor node
      arm64: dts: qcom: pmih0108: Enable BCL sensor node
      arm64: dts: qcom: smb2370: Enable BCL sensor node

 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           |   69 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +
 MAINTAINERS                                        |    8 +
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi          |   22 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   11 +
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   11 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   12 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   11 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   11 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   11 +
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   11 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 1440 ++++++++++++++++++++
 16 files changed, 1655 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260720-qcom-bcl-hwmon-6d602c195eab
prerequisite-patch-id: 1db32e67cbec8d818eeed046d68022414227d2d5

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

