Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72CB480979
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203123; cv=none; b=Zsc4YIO/vkFRlaYIup/Iruul7xgE+WLCJYXQWVlXvGjeXJclm/LrEa4izXfyZqUbOyYy3VaKtCLUT+sMNcYbom+yv28/l7ChJnIkzsSvdxU2N/z3Tlw2YSl3jyQxOW+Hh/n3ixUFpGKVKItv0J04ZILMLHrH0zf8IS2pDH3VIEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203123; c=relaxed/simple;
	bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNm9wejtDvskHivog85I5c/uJazG2SLedmKrcIkVjIwDKcM1kB0VTtQS17vPWwpF48gfGfSEHZ014Sj6XPzbAlWq4nyd4b9XPd2AORnJjMTNjp7jGhEYLpHGJLEyEX2Jjyf+ndSRrs5+jFbcC6snYqCpBZm9wVEPhbPy89Zh1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvxnH/Bw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+qDufK6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvxnH/Bw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+qDufK6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFgHC914222
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=; b=LvxnH/Bwik2EhgZo
	cMucxqtju9k1R4FGbmT2LP43/ZeOyuhgFuyxEvJCC3oDxfRjB4MaDXYo5V//0oaE
	LrWX+UA48Y4dHZbovHduc1LXQIbEFcaBZSQya8nGsA9FiJrja/j5SAcIDfg754GU
	Pek/AUwdkMVbNdKldQTBFPjWdlq+Dcu2Q6FTuqcvfpKsn7BZBEz3PUw3hzKyssx1
	CMNqzh+TR5mHQppdzPPBNrvX+oLbMpl5/xMMcViNk3T3qtUGPjW8ToFeSHqlS4NF
	H/926sMqXmJ9HzPXerks9M6zuNG0rdTyXCl1VfhL4PlmMtGB6vT8XBiSbiYT3CGt
	hFog4w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:20 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-80621978fddso1292261a34.2
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203120; x=1791807920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=g+qDufK6SlKgkKSwMKw2IRb3QViSEm6NgHLQ7dgynKEHjXshvQfswydGSf9/jq5Jox
         GuNRx0TSxKlNtkIjI691n9S2VoKRRR74NcU8jxi12cXcht/DHy8BGoyBgE/PIHHNDpGJ
         Q7abEMcZr+kPtjCq0OOSydLKXagsm+jUHYga+0D34d36IlTmUsPY79ibKhnERE+rd2fK
         x3oRChaAq7W3Kdjkriy6Tk75u2Jf2Bmih0Xuk5oujgeIEvNjdxuGBTBeAfBK2+V//4rH
         /XEGlxMqh+En38jTqaPkIYxRg9EFmhuxeJIHfXe4Hg7uS+62ou5RwpzrlzTD9OsB2dq/
         d0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203120; x=1791807920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iP/rmLAH2uQHpy0g0pb++AJnYnatGH4acjwykoyxZ5w=;
        b=Ze+C9cH/PRV1SqR0RtaGOtN0QWOhbs0OpZIxXsgPieybRevzxSZKZaAUcVZulPpCB3
         flc/4yy+VOzdg1DhsDMM3eD8fGixLHQIjGFcvUE2xP+bW5tt+rKoBFfaGq9OM4HdrJIj
         QuxFS3HXIlTHiitM7vGt60sH3vrtJBDi6F+NUukmTSH55G0BjLpJwpcaRvtfDH4M43aR
         N4nnsM6RXRdTdMRMrgi72+37dEtWWLZDH90TOophANwf14z/O8tdid+LiWjpPecxkE0k
         6FJ1aq8fFce4nwOn8f5R/5vipCtdqEPXNoCw/1uWsa+9AhZ8psdjJyFTq+Dgrhsfknpx
         /6DQ==
X-Forwarded-Encrypted: i=1; AKwUvByEWscXmost4BC7nger4JvQRefFr1ji0AfRhFkyildX0C25ymkb0lWSX3RJOayJt2ezwQk=@lists.linux.dev
X-Gm-Message-State: AFuF++ngR4LJyWw4vWBIwFUxpg30xboJFmHImPbT4UeFYxzVVWx25Fu2
	hI9gmEZu877Xota0IzfnPxuUJC4Z+RUoUWkN9ZK3uFBsc30CEdHCkL2un/kbHyqsEGOFzKYnbz3
	qXEh3gGH+FsfkacL9CFyj4jMtLMFppU/lh7FhVPiYW8iaU0nbrxv9J94=
X-Gm-Gg: AYBFou1PoM0sY9rFftMnQKng/Ee5g96EEWoups+KY/ro/WFcqC/bdjAn9JtyA2y6lx2
	CBCuaY8EjechicO6g9K31p9iqT2xXwBOk8iy9Q2oHidTVx4AHMfjIHvJC84isdoUE+YoannlnT/
	LIfe4kQFCZCQ+WeszpFjsRMzXbIv6v5O8bqiKRmwAWwcK7P1aVBn57zWruGq+lZ0aBRY2N4tVo0
	uoJOLCvMQxXml98UCYvX8V7sbe+FUgcc61wJnVULB2m9JznX6dRbAwKHfXNclvFU+5P2n06fBDg
	k5aO+r7TxtEFF0j/NBiQL2uMAZykjFk1AMGdZ5H/KnWDl2EGk+BlnMtcwbz9seD9h0zSSaTteNk
	QLZnp9R710WH27Wejnkfe4q2Zqpl2xSS/BA==
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374445a34.0.1791203119921;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-8227eac1882mr11374425a34.0.1791203119382;
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:19 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:06 +0530
Subject: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1220;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=dwDSmlc61jnT+AWru7uQHSWcbB/PF2x4JEqn6VemRVs=;
 b=USfjZgve7IwAll0Fc3jaXO1yeYZXW0dw4CRX+9heQYvw82iWdkDm7r6PnwgSJ0Zb6xvXTv9Xn
 fiMb7YIyXn1B37ngJCt1AT9ZnLbbGQdMOjK0wTOh7Q9BnZzT8VgC5Rn
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: z7VRoFNtUy9R3-egBD3kCiRcnMmSxYiS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX8Cbvfjgd5w7g
 oNYQheh93YbL99aCSw6EXzRoOXVsNKwOrOCyn/0F7HVuN+M6gnqfb/S2uM2SHOw0L5Az+Hvm2HI
 cu0neTN5mMx2zfORCdCnDa//PejLjfQ=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac39730 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: z7VRoFNtUy9R3-egBD3kCiRcnMmSxYiS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXwx/LGxWKALlM
 thrxaMIu2HILb/OTpu7dv6QeQ/ZAbN/lyynUt4DAWs+WhO5ewXPN2LjatGvMECdCiLtHOJi8jsN
 0sf5quOW4USoMiuVBjc1bodDM8k7M3A6IntX4DoeJ1rs45HO1w/JKV7ssy3j99x8soS0o00Nkhh
 DTxXjOFxJcLN9suWrbcyzP6/c1TddHrZETfLDsAf8yeWfy7/fGsd3EyiSEnClL9csPYynfVLCpr
 ZxnpIWlu8rNTUzJkf8xBZgoofVx6ivdD/LoCzgJLfhSiLOuANuDqbL4yE/gZgg+llQmmT7AwndN
 gHAVUsez4Jw4f987ntCHasQzjJeJnKCTR4VVn2KP0n0M77e+PcZ0BtNmHfdhzGsOXzdqzA5S5Tj
 WqFKBP7J6xYbmuu6W/2zTAC4WPrrTLZ90YZjVK8rejKHmGLm/Z9jF+b8PKzfTxOQZ5qxEUnYaOS
 qrs3vyiuSamSQhAZ7RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..9cc734001a68 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

