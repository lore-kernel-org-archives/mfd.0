Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12CE4DEC38
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772386; cv=none; b=fF2cOMr8KSIkE/m2y7brPBladzYE+ojs8USvopVQa4YN7VC3lvhUnilf1XdjkSe239cpl4a6zPZO59dyDuNJN8igygoxOSgCcBOqE24+y2FuQp6Kc5P28CCzXBBx5eoByqWlanqxs93CTORC089CJS+bmbwcO7UaRyGJ2Gpj89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772386; c=relaxed/simple;
	bh=OwMBGkTxxlftGqHQVuri7f3NF/sPSqI09SGbY6RgGfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9nvnmbN9JwuMVtJHWCEzVSrUzu8xkZBf7WxhcNRZ1UeblSjzU7ANGGJLbOVcfUlO1B032gOuhKQFf/lzvdKYLIsvD0bzuyYaFmwsEAt11eqlGI42HSd6DQR3ymUIAREef7fgYlIMxCDeEZL+GsBvXCQ0nzIE4YmVQJ3zPZQrkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joz0ImjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRaCOgFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joz0ImjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRaCOgFc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hdS2584078
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qBqs1D8z+Wk
	6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=; b=joz0ImjPNgBDHv3i+ikrV9sDiGV
	l8UoCX+y7I/7+sgxut9htzHJBEB5/PZTOYmGnkBKFK5JVkwR/JW9cLznqdNcZ4ha
	t4VBdzrGzuZJJ6P2Qk6ZuSkAwkWT0JFjelE5dlf00QaXYQdNxHW2YPEeqzq0WxG3
	neEbPZs9txWH+f/ATlGiYSdL3PM+cHvnNtq/D+UA49RM4mlxZElJfc1IeOf70rbf
	Ix4H9uwBzwD64gKh8xABuhWvbDiWsSABfx0DZr5VFemgQ5MCHPja4FPRuawzQ6lB
	ynG54yV95w35YcjXiM7hFZjoujd3plqCHZDZfKk3WLm/FvsRSNaTjRSN0Vg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhejuhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 12:46:21 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98513b850f1so298589241.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 05:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772381; x=1791377181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBqs1D8z+Wk6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=;
        b=jRaCOgFc0yhbQD7RknRBkqSiRJvGBljSYS8xoWM5KNnAjYr3HINb9T3wJHnAKA/mgM
         sgAeiFnsm9His/74EgWUAAYiQJkR9RqhTN3/CU5teZ0c/3U9ziQdMpP3Dcc+A+FhhzfP
         ph416Ml1dgr+vMjQZFSqI6ZZa5iK2tPfudrhUnmysgRsGYwVM+BovCgNzlxbjj4t00vn
         dYxavJrOZsJFShoPok55aK720CDQ5dpc8CJtXOByt6Bcr5qKPyifqzNWAmyrlnDxYjp1
         8MlNuyhMoSYbj4k6YYrX6BindjiCZrQ9qQnABbYUh5Im/7oU2BFa8bsh78cVTOQlMm3t
         Kf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772381; x=1791377181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBqs1D8z+Wk6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=;
        b=FBQP1GzVyM1ECkck4JKvMjvzsla327la0dPXaWOOaGPAtV5gnXTiLr8x85BmLzVe7s
         xqRyztgZqlfT2+kBGOe6j359LfnVol/xJloxyvzK9SGAhGNU4QlJQt36mwMAhED3MRNt
         ULBJNBf9L8ThYb1O22+08U60WM1Q0QrgyhpoM3ZMBGQwJRpWP6ftui3fAhkwrkBpT6rZ
         JK//c+nEPD/5cUU3o8wFV6VSZiUk7RxYR7WfXuaHQ13taM1o2k8pCvI1LdtTX0UHRwtK
         do9/FaYlOO8wg4z0JfkuYssHngiAPvd8P2Ff64pQ8OSgq2BgALsJb9AT4zvOB5jvCNIc
         KiWg==
X-Forwarded-Encrypted: i=1; AKwUvBxB3REM2cmuyCbc0mRuQYqo1Xu3vYTIYoEVe63RFlGhx4hZu95nANv2ciatp39o395Tbig=@lists.linux.dev
X-Gm-Message-State: AFq9FYIo5y0uz/kJdw5A+SB7coVFMl+2iyRa5a+pujVm0CGZFqcc//SB
	sjl+fXLQGyf5VERIwSENqej03evfNRZ+8ccjscQlfJn9GHQwKMSViTaoVUb5J0ErijbK2Ee2gd8
	EqthAdpRpkiepaytgP+eBYVcbWhrGGlDl0eGpQYVEk77hDnKwfaiyCMw=
X-Gm-Gg: AYBFou1DWdVLiXTz5/qmuT58ewRU3C1zqR/3Xvnn5XQjYJB164SoJARB1EHajFL4ojE
	C/SSeJN5imYlu+fyb66tKD8l62K9E/lZRM1ET7i9PIXzPtjWnhffOX2qmCUueXd/3Jj4VfDxXma
	4OhPplarg3uGUUjV3KYEmwdRO39zv4sN0SgKfkKurIvKjG19Go7LnOIvnIXmuVhqjvpKvDJllO2
	3/EWpoZDZCYDgmgNQr86tsacFb3ExgkWs99ptmh6Pg7an3N0k562z8d/pxhxLGdk2uGl+bRPofd
	Xcp9nje2OGKeb1AFnjHsKMObwQjuDZxzRFHhs75Fjo4CTAhim+zSrzBiyT5PAai4Or5LE460Xhb
	GTIExGGvEjMuv
X-Received: by 2002:a05:6102:390d:b0:7ba:4342:f314 with SMTP id ada2fe7eead31-7be733a1367mr223777137.25.1790772381170;
        Wed, 30 Sep 2026 05:46:21 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:7ba:4342:f314 with SMTP id ada2fe7eead31-7be733a1367mr223751137.25.1790772380570;
        Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] arm64: dts: qcom: agatti: add LPASS devices
Date: Wed, 30 Sep 2026 13:46:04 +0100
Message-ID: <20260930124607.1109167-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 43o-AUNBwnYozW6bWnxyGqXYGHcaboCy
X-Proofpoint-ORIG-GUID: 43o-AUNBwnYozW6bWnxyGqXYGHcaboCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX1xCgHR88GEwe
 Dskx4xUzFnhHaxZzrkoZe2skcfAknAsEw8EhF5brKNHWjqFdNB7X7FQpdWRoa79mzwHFhHGHW6y
 iN9ChHCI0TWs04H/aVJ5oWIs7+7wYumGgSfOociMwWjk9yS0pdBHCf0gyulGykAKETVND+aiznR
 XRWX16CnsKDyGe3zqDEWHmbAUvnK8BbI5wrgBuZkPZH/Cy1aGHacr5YLymwaGTWU/p4YihpU/gI
 LwapqM8k+LLZfh8d0atNiAVprRq7RIsJRVucU0/INsado0W7z8ADM32O91Hk5JW5lq9FKKhwXVs
 Kdl/P2gV0+m+9/7LbqlOtZcMCAlQAWXX7eV29ugvS2bJ0UIL9upadV7fgRJtc2CNp+EYYbOfvfk
 9sq4oTsMhT6QccLDPHpjF21dGJvNvrp6OAHfwTAGiKF7nqnK1A+3KlghA4lpdDEsmrn0l03/vVP
 mBr9vOHUA4YPa92y90A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfXwoZFa/WMEAyn
 Rl9cv0AZZo1VyhvD6+CglBcxorVVyX1X9cPUvEHeHpJFS0nnV1wALEpplgsP1tXtgVoFPKncUPT
 kSIg6aJcvXEHoFV1N/L+u0zIs3n5Szs=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd049d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OKQivFIISjCID7q7bPgA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbfd2861..c208649c92ab 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -778,6 +778,42 @@ data-pins {
 					drive-strength = <8>;
 				};
 			};
+
+			lpass_tx_swr_active: lpass-tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
+
+			lpass_rx_swr_active: lpass-rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -2246,6 +2282,127 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x10000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7e0000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7e0000 0x0 0x12000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.53.0

