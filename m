Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467372;
	b=ChLsIfVwK3akSxWsGrbvb+QT8YrlahR7F7N9bDGbfxqvOVFPRdIIqZzDffR7m9JLe450
	 94FC5zLRXhZxeYtmL3GgscKsBxAGgjWrK4hqDzpmQ/afA316h5dqYUmHCqqFRiFbBTy1u
	 fWgtBMFKmH21bRCmn8/gvjUL7kJ+JyRI4xU6aOdtQTEB8ZoxeVGPLQqiYCkqIeDGGt3yf
	 kgItvVkpnftJYGFbjeOI5ZOZvMuhyQNtLuWNdG71+FqE6LueCEWnH1QMqprywUssefIQv
	 eTzYWsy3ylmtTuoYHV7feY0MiihSt0UREklLnf4HNiajxWGjwUodIX00Ygo28jrapbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
	b=oiVAJDPXZfNEjxFEa9GPMpdsag4BXexXuvSB5SyJlGU9RlEut1RYrDnGOACWHMgt21VZ
	 rzpzMiB/CqjmEJeaA/C3iRAAYzJBxMoY+E5koHwvUrSsKWntj7T0mCfZdLV2GzG2etQsH
	 GPQCKVKxBp1ymdRZPWE0jKQnTMCm830IluF2+GZ8VSU46QG+36gK83aV2ZYzmAWBBZy6q
	 UWAYZff+SRFbFEnm8gh3AyKeVivwTzlcdPJU/xB6N+AzckQuJqg7VNRp4EABJii2e59cU
	 EXG+JPGWNYJUTRSOCL/A5RtQd5RYUpiNrwVTjkauHp+XCQuYvnaAeSCyvEYhbCWSwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yc/RjUQj";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B41606A331
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B41606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc/RjUQj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuf4D026207
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=; b=YGlpvE3185+zcNRC
	Ke6y79Wm6NsMW7wrJaITFCutoGy0RJTFyhQrSd3f/2P5YJLxm4aWKl5/u+q+Qx+v
	pUHFraYXZFCvEenCOgBvUsiH+fGFlBg9Xl2YzVhGOHr7DuHoOfYuTSt4/KlL3qzC
	1vmlAHOdP4TSU4zPU2SyUILNxISbbbYrHOQ2wla1ehB4I+X96fAc1lJPE20vcSbS
	kYU7r+y69Cuxtt70ZuNo25rIm7jnVjK9VwMDQq88ic5epIueLXk3Ak8CrSZdczwV
	l0fHUmOJC9Fh0iBgQ2deWU1IuMKOgJnjoFJ3L18DiryGGcMrnpPYrWQiDynPS4H9
	1BmFeQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3fg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so2356018eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467370; x=1796072170; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=Yc/RjUQj5zeuzYS2cKxs1FSkicSdfIZmEIijoK7tHSbEszkKTxoce1HASCWuDDJPnD
         Uq7xOJKXmiRoFvUf0VDsVv4biY3lmUK3TJLe8fDOcDTRI6/jcKWw8sP6jgVMyeyrDNbG
         e2TIhYaypSd1SOM0cEgF2zO9wkworV1iTRdwEakjSJ60cmT01lzk1NYsMu0q3UWAjjoW
         dQiS5IKiDYmQ7pbpQ5HINGtYntoVNS//vuQ+GnffCL4/Vug21gqtqKSf16wM39hf4Dxx
         oJoRvsuk0eEa/1PJ+C1lPfB3vRe5BDObVDjJv7YBPWK2TG6zfVa7XHDNxiXCfMuI0maU
         2LtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467370; x=1796072170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=s/9rZG6fwQSJUpG3dV4P6CFS9Tbu70+c6GGG8GtzRFTJLU/6Hzbh1onmaAlxr6lvru
         6zwEAfwwy6Udm7eVjwebk7jLBiJMdSny54pA+aQJ92a2icJ6gmaSAdSz8YAeND8ZvB9k
         wAkNRrcKTMjx47Mj0T2hulG2UhuqAj6BWAZa/zIMDCQ3n92dUkZG5oFSYtUqCjBcNRjB
         KlvbZh+63hnODCNMFOeYRxMU3gtNGAbMo1cb6ZNbD4ZtA59B/jEuSUe/o2aLVBIitUdp
         5fuvl/C2dbHLZ61Aa8Ao2Ca16Qr2wBWOYV+REOx6wwpOhVDBm2MqcvYJnb+BaQmvTxlH
         nqrA==
X-Forwarded-Encrypted: i=1; AL+hErFf6DoZbzUc/N0AFgkuM3nibyEZILGsd3VqXZs8OPZKPWuVGQkd33sGX1n7H5E/dyQdQWM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/VYUk04hkOSd2vO1gRnDA53O8AGpmWY1qu3Et3ppRnvXFNC5mc
	o1cCQBregbckiz72A71JmxX91KcVKqz1CcCivEqSVqR1cK/7COTNyQn3KsJEXKS+BowVuFFrsoU
	0Ydqu9PjvmO9TcR+uYG97ch5Vut62PyhY5F3sdFNHKxYN7I1xyqbCS4A=
X-Gm-Gg: AZFdTZeD1BpiadiEN/01H3oYKzNwUIKFM+cNuNsp3XNR/KgKx1aZN1/7VFuDAPQmY0z
	Ml95knq/aWzzwyn/0na3an9eDcyr0oc6ZtP3q3O0iSSN8TxUAjzFtzNdNM3W1juAEsnbUk4sO6l
	jM4C6Mbo+DOgBq7dGq2d+V4KzecOfQ/8fdZiBo71KZlF+WNZ5qEBrhqtc3A+GCec/u+lh5L2vaN
	faGk4Q428QKMRN8yxfipq2AtXEq/k8tYiYIXj7I+T1YvPpfMcinewH9hIJHwwHwythdXJ1TvYwX
	dcJjp1SC4bTSBLZX6SGkT9oM619I/e+UuOgHwlCKM4yvCn8mypVJe2kUxc+Eq8aAWd7318wwXYD
	kfpcEGtnb5+9++c5cTfO1oU53B4ILDMbC84G1BKNYvPU5cgDgvHuAITIlLyE10m7gJVYVhSHGAc
	o8Dt63UXdy
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946894eec.2.1795467370507;
        Mon, 23 Nov 2026 12:56:10 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946867eec.2.1795467369912;
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:50 +0530
Subject: [PATCH v5 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-bcl-hwmon-v5-10-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1326;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vQA8tXnjMgCPq3216Osyn7C4Zn7d/iM3eHvItTtMIyQ=;
 b=7o1OGucmXYOKDo2bVa0gCDnP/K9W9ENk6/wgM8rCg5bs4t98Mb2pKpchVkjKTEeowv0fgDD6U
 tX3jHhP85+KAH932WIpkebZ5iOE3RIZeitr08mZfWSp0Qe5nSe0i/vd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: JrMk2_l3sXfjS7jKr4QQI8OULUA1ojQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXxC2y19fhrKTO
 sTbO6ibh14zD0FUUzuQbDDAsQSq+Wb4kOBVWwS1zdHOZVERyz+GusgwX9P/9EHn8m/ir0A8/NSR
 635bstzwG8Jux+TzDn6QUasbhyJB8ejbxQyPMqUpuoLBxHmod8In5pQfF3ZLZUO1ybPSDxqmjz8
 fdDTvlIE7DOMr16IKYrD+MMFRmW3oBmTSPfldqSThwcv7Wzn4QPcAfrN0Rcjm/IEWX4yAmXANBh
 8yQ1+mfYkvFhS/1DxkriS85vwXfk5bHeqyQjU4i+TyBuA5uc1gTzNZmdb36bSnJVfDDnEV/fKVY
 /VaYvge/tHl8eOxH1t+bzv84NZG0el2UIowdbLnvR/VFxx8AY9O76ee6bOapQaKedhm+IWVdthZ
 pmBtrvRIc3FM6uyMZMjD3leYcBFXTX+uYLTf6z7itsO1TTHPoSks0LxHRzk5md0AQiwGqc4XFE1
 /1ECjagunzrVnykhOmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4C0hMybMMVLf
 A7g+FyJ1kyurHq91TR/jvKu4R35GQmfKICzD73PJdHtbMRn5m7iOrwbKrjOaByLtTVZ7fm5neA3
 PozRMx/9QEMCs0CXf8VMt/7vZB2cJy4=
X-Proofpoint-GUID: JrMk2_l3sXfjS7jKr4QQI8OULUA1ojQD
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a86b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

