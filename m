Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467379;
	b=dzNtJfJysVYhthJo4u3vgvn9masSmZOh1AvSC6Hcwu7ptPxQl9xYFS73s1xTT3KO2J3d
	 Z1HWlvm2t/Oe2O2bjpdQdw8P6iPZxcTowipic8df9aNDxQ/C1da5nNiSBBCexKHiI5QKh
	 y9pHkeY7s/cI3H/oqAL7O3VwgX9UeeLuPvSTHnMyw+nj/W5c/o74UVwre6D0K87QEx9iA
	 Nw0r5huV9XK5vHbocC8KCCOSnFd6broRMlWq+ORfLMN9nUtj9ciHGAq/74Lx08jmhQF8O
	 8N6rlzma/vqpaA70IGxVEv6PBALrJYFemCAMShgghVX2rAvHnRvKWrfB9an2apEwvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
	b=EeSg288sqJI5brB4Bim3UIm3phNgC+yYh4ScTJvYQ+fHNrOIyTl0YoC1cLlvgLtpovBt
	 zqil7eqLN/FFeCs7krkyMs2S7t1LKE0wlKNP60k6sl6ZjVEdOktgFvD2PyAZvcOGMGsSK
	 9L4KOMznNgB3J9ohtwzM8O9wUG96PStezjTVaoUdjyMzGCmGjFxSAAp8TVWBEBxtBzSHw
	 LstGoC5hek1zxL6aB/jZXdBkrPkE5KURb7IR7B84nLpIEzE53dvTGguP7gOTRMDycwRaf
	 MYFxJAv8GIoRiTGaFbab6wr4a75qv3LZi171tBRhaKVxlzgZ+ncdFtvX92lIRvNXxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i/c01eOJ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A6606A337
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015A6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/c01eOJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJunCg2974403
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=; b=PoyNcrf1UJTCCSFM
	OZDfLj0txBnlx9abpng0AGg36Y/GVefkTUoiVav6wUTNW1aGZR2rGgxRSibv+J51
	PaPNGSLvIBd/Ot/FVAAsaWDwEwtVcLRKbYQ+TaeMfe8zXXe1OCWia62s3Lv+LgYv
	u4Th0xLmdBysF6TaqA2P2PVadMhQxF+FJlGkkR2GMXx8LZGuTavH/aXTcEhqCjt8
	siGLyrTUDEYziF9SZdg4jmpWP/kk7AnsTs9qAoSMC7C/UgBCEIjCEiE8EIKDuRC7
	dzgah3U/3zNb2lig5lgCWOrKRvEDhy30ffBV5WnV6AHQm4Xv474uRh/zH5xYARrY
	DMY02A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03fd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:56:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4156192eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467377; x=1796072177; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=i/c01eOJdBI4uoUZXnc5tsYEekdC0NRAVNesPm9suQDkuRPynY3zuJLBKDEqpEBMsw
         f0DyNKRsXlZRXTuE7WyaEU/EFbDvfJK3F3fquZ9xD6iASUEcvZ57P4iDY8PzgD2/yYUM
         MQmnZD54L4kgDkJayN0r6eeaMaM2TmdhZ9GbMQTyXttqBY2uV/WLYcOfEUh4OqE7Swce
         AHuoXy84dJ2aDmo3odA2X7t/vV0EA5NS+Ao1rZMJA4zCFDrFApMWntItAKLzw0WYdpqS
         kTE/D716LxpvynrYPhI4AUFu+m8TNiTg9iC8ERZYm58+nQSXJBSdEKccD2GGnPxXxV3/
         yT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467377; x=1796072177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=cY3OfkT5+U/7h+eC0jGtxBvlrVOnskkbwX/wjiRftRCyvYUsi5X2P4rQT36IdgIFk2
         +wT8jZ13p1Md3DJ0n2VHFnwsatsNQF65K2gasLPNsVUhncjPZM2pkL3nlX6TX2lunThT
         /cL+U2/mhKvEbK+ZPVhh9ogKr9RlwL5c/1vAxF8O8oFVgPf5+VpqkxDWjMgxrc422AJ0
         /oE1N52iAJFK4KSFmRKSRs+mRvARULZ8Wi2YbobGL8VPLX27KXeepjlLwiH7xSlDlPv3
         aDgDM+7a3w2fgVL6Oq0Mzs8iTGgDSWYb4+1itX2yH9iqga4KG8E/Wrh7qdRcQZhinkCF
         mctw==
X-Forwarded-Encrypted: i=1; AL+hErEoi8nH2zdK0WbWKy8ezl3HEUFqatP4OLAaCwtyaRqxEOGQo6Ja93zRKPTZJNkb75rgQpk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UInJs/ilMfaE+AdNXx1rdyjeWiVsD7KeQ5TRhcjckZJLtXdlX
	8t6Oy0kq7/3ivQhDCYTXbkl/xk2V/4g1OhFDKys5zt2eEEtWJJ8e+LgzsLqm229EupAQLLu8DU7
	6ZsQWdf5FkOdWa1skORmY3LLOEXO+XT1NlrpxEKCskwR4XHnjIXvb5cA=
X-Gm-Gg: AZFdTZc5HUxfVYhZLGQJMHfUHegreght5nGmJ8JRAYjdbOW664SuZvU0zQZpXqJAyuD
	Ca02XTDrw/OOm7ihwRylu7aNLp69BaRkDIdqcJXJd4NjGqNzLp/MHoHjS2mUBloJjUQKLeA0Xal
	47EKRTy4VFPGLYaSbiTaM2TZgCyZAC7dsjfrWL3LLQquPIqP+iTcNCrVBYxLZk0H8lkvHe9ytRQ
	bhimvMByyBDMsEt9O94OMC8qdZQlqCb50zjm6/4IXAgkePxuMK3uaagkop2LAqd3rHGHoAI16Q+
	g42GBsmB/rlC7dI43kMQ6EuNUIi7IXh5fvH7A28eNUBiW+5UbW+/M3Mrdlxn/tlirNVeCG6Bbgf
	vnARKGJ5MnUdPzODEgeSWrh4X3k0qC/9ALEHpGFNEF+g9I2czSvboCgcve8FsvNdpMQxuY4ubQp
	Krb60SKoLt
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275537eec.18.1795467376941;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275508eec.18.1795467376284;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:51 +0530
Subject: [PATCH v5 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-11-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1270;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=47aN023hxv9OOnDCfygfziDOOhs2YVDNkTzqFv8vus8=;
 b=hM3yim468dCAZZp+27L7bqnFCF4BVqSMAsVAklDuWBZmBDI1auh+1HvrljOPuRq2pQrG5Fws4
 nZOhGgmi+RwDP0siclczf/aKCddVq5f5v0VoeRTAGrBt4uZK5IGGnhf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7hCcBoaNA9e9
 Ea92HAFT0RUxFUFEvdn9IBNXPIpOx1bSHNrkJXPVKX+bly8ng2DU9gLWP9ulFiUZXTAzBK6R16g
 6S2ub9fnWQUTeNBval82R/ZTzeHkgLLxFj4sHnCV74bb1BX9h4OkIP33+YMwZZXWQxAs16nsWd2
 VevnPpJcD0fTdbzeptSrUS4JBhJyP3LJe7sDfGXk92ehjr+1rBkFZd/qUJc2aTsAg+RXidA6L9a
 kJwsZVuSvkkz/tBI29zc9Q2oO/5bgWcHJ9H7Swqmsp7TQl5htxYEOPGCfpamLD9J+E2wdfhGQLo
 UeNUWIo8P74PdxKqebA3ZvGjRMghuIsDrHw48U5sS95iBZk1TnRSPCSzjuRBfAq9STwji6qajGB
 kCRbVbOJT1zHrcrt1cHL5qWMKvDoRN07EyjFjQtIT9XUz9m7PR0NgUaE3MsBnUliBNS7oK9n54c
 dtymUMGgGX8p/AfuZjA==
X-Proofpoint-ORIG-GUID: zYoO3aULh9qv1WOj5v7QBpPOT1I3D_O4
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a871 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: zYoO3aULh9qv1WOj5v7QBpPOT1I3D_O4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyiEefiA7MZ6+
 xYFecH6MnNrSAC+JX2dpN+eupaDwrDkpST9ncnob+sNOURzKHBhyyDqhi1by5ynQ83kuT8d4d/P
 cpnNgeUKCnh0A4dHcVnZ6426WV3b5RI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
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
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

