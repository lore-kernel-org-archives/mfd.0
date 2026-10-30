Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341301;
	b=IlPlteXoaYj0eBOrU/8pd5Zfivicwf8Y+EuPFMUU1qh5eGaY7Z3GQGQ/IIm/LSIL8iIR
	 StSdnL28zonh2//locwDCs1L6DOPcJCPEw0AQ3bwNr+nRt+6IhL6MXyst498Tp++FJSJC
	 9hmGktVkDRLcmTNbYtw5ymjGHeB8dQAKBo2sEPr6TZRMl0AxAHzUlMAF1jQ/6L+MylNGJ
	 xdr2pgY+OOhIc/oKiif07Th6qWe4W6y7PQUsh5TNl3//PuNdyHCXCVEd6AcMaTw1k/FZk
	 zMuZj8PdWgIVTxYxeSS07KavhwNyhYe3MxmQe/VGRJDtMdlccjUqxLHS8eGKr7CLGkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=HbC7FgE6sSkCOjji+645gGo45JzgE5zqPUWOCBUOprwiHc5IRwgiX+ZWhDSwDx46udJQ
	 vO7R8UX+JUYiQ6lBPo+mJ3w8XzgyywxlEDNmDWyNKzfJHHtLHamCnDaLOiuk6uAHDJHEp
	 FelNQgum3tOhszWZXSTIUGC1lYbku82ygrosV8zTwYh0oALDaePSAEy50/qmMr1C+nsAh
	 T+JvqHZ0vpmaq3nlFDC9nb4meTfeLoDuwa2O9KggWMRRBGCf5R6bcOzjpHxk3gyhk/DNq
	 WeH0G/lyqwmgeri58r1GlUZ4mgNYVnHrfw47/IXvKtHBJq0sdVWei6LoykTBjrZcnyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NsdU+Mcf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC6606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FC6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJx0+RIW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NsdU+Mcf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F6hZ725183
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=kJx0+RIWGjQOEL03
	Toy7PVs0f6x1xYEJwZ0EOGsCH6CNwd/JJcloH5e4EymGLPNKGU74VQ66qQaBVOEA
	Kh7i51CHb5lHJJ2qJmnu452UFF4nWRcS97Yx0KaLus/PQJKuvd23lfU+B0NeDnhM
	U9mqUEFpPoVd3vFtHdaGMFM36EqFH+PGfRzFNRRVDO3hjf67HVz7vk31HEpxkg8U
	ajWEw9+rwevQvbbAOVeoAdR0/4HhRhFB55jGHFQVBkoV37vrMXDJm+CNdRk9Xx6H
	YKIgLbDwhpdigevG/ve9r5GKXj9XO0zfsgF1uwBzQ3T/3H61sfEW38PqAKFfX5TB
	CUsMdw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so366078b3a.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341300; x=1793946100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=NsdU+Mcfd3ALgIz4/JDaf2wY/bKlJM6M/Uzp+4UUCT09uAApd3QGkaBHN2a8UWYtuz
         OwoxjyTBcghnw/IhWxYmBpudIlyVauWMoEo+A1HhlCdoCKelqbWvZcRb5b4Uxx4rlvHB
         sOTcNW6DGRTg0aAGjecDBJ0eclIcOiGHfv7Fzk3YM1IHuWkMXorxPMoL3J8izv3FTb3H
         CjL6vk4Q37l2ba0GZz/BUai9POeSPz7o8Rypmz7tn/9DLfKYXmxNPG1/0lPgGakheUGN
         LiyZP0Y7k8fAfWqSaI04EEMjJntRiwUuYVhx2j2PV6CPczZKeLvAeAuNzmsQKIuoUpNS
         tTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341300; x=1793946100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=u80dRHTWcDXZjo2nKPB5lLACQ9QoG1wMkmgAheW9uBQDNGudnVgZW2hFhi1nhRW7yf
         eLDa7QGxkf+7776pk4mfNExlK09M5R7UxVOO1xsgbWiIxP6zdINuzvFlzW61vtxtbquV
         PE9ylXBMPfQgDVfL9lgUeiJt3F/s6N42Sa1yUs88+6aFDnFvsDmabpMSKoxk7/9pI6Hm
         netgwg+hZxY3JVQ5T0SQU5vAtDYhLkL1gI7QY1atYJWFpAtCRe934Dqpbk6G9SeyENUO
         cyxdU1xgzaS/sTZIyTSleVBe3pn5FW5+88+0fS2whA3WdJx7aGuQ3mYUVOoabR1Hq3Io
         oMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdr5H+eepfQfyyeYdK4GlodVzpsd1h4CesiRzaxdRrTOqyYjJKrq2tBEIhsBGIUE5hKvU=@lists.linux.dev
X-Gm-Message-State: AFq9FYI8PNwRoQSd64ABJsIzp/d/glRtvxj4r/on7m8PKL1ha19/oZtC
	N8dKj3rUSJwFaONWMV8HHhQ6cLL3VDgRXXBsAU72wjrveTqjMs1BlHEQAlYAs+J9epWkRsHudZn
	U7sA3zcJ1BBqKKMpK5ujTJy/k4LlyqUVr9dtcWQRaWyN6UCg39x7Wf/Y=
X-Gm-Gg: AYBFou03mX3fbiHPHquXL3cS5Mv4+dTMLFodK4fXMAq3B9WlvwzmtlI8vmDofuCRw8I
	as0xpg2n3OV+seJ2jIyjGnG2wQ8lC6k2bbyoVcb3PdElsMVqpW4HuMSB1DKJVZnwZh5n6EPIPek
	Fho6K/8EYSyhPwuhNoMLrPEf+eZ8AOKM2vHhr1F333Y/Nv/Q3PnPBj7R1fLu/SCn6u4KL20Dcma
	9vJywaaiunCN6ERM4DANjh/Mdjd+CgtFLiyvTbzkxZs6LFLSft1NRNch4eVuZrhHbqbcPt8E8HP
	UZG/f4D1hBWxD4f2rdia7GbPEZ4oS/t8nzMVXxjfY5H7Hmq85jA6qy3jZIL0UMTNID8cUkXbPtV
	2ewBKbLUPYu7i98MJPKJmtEJsZ3GQKHGwbB9cnE2/bUnX1X6oe4uf/Ge1IVXr4Rhu6eM=
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209652b3a.18.1793341300162;
        Thu, 29 Oct 2026 23:21:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e25:b0:892:a4c0:4eb1 with SMTP id d2e1a72fcca58-8a9bcff6a77mr1209631b3a.18.1793341299712;
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:54 +0530
Subject: [PATCH v3 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261030-pm8010_i2c_support-v3-6-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=PZBL5PDBWrGF8v9vICz/rjOoHgZ6Sr5icUeqXHTWjYxJzByPsFzF6/rbxm9JMZk3v1bAT2wHn
 04OGor/UivlA3u5yQsBIIFIFv0xG6jW6KR8tYwNSq46Kl3TXiRZrUze
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXyH67H4FwiRXE
 aBDMYa7qWnyDvYiTkbWGhjMyw5SbyTxp17T9hGFOwlCKzcBIIRvNzefcCQexV/+HNng9+Q74oZ4
 8U6O7ki/vA+vau18ZlJxRmKb7kmLGYU3AeBA2JiGiNrQkx0B4K22kxk44d858b0sln3vs0UAGz2
 sRoJ7K52/kuGw3kCuZqctjkongp+71lAJ8v02Jzstcc04NuKUaYMn7ZdCUmbgbgiZmJFhKBqqZh
 KQhwYF9ON/6REonZCoHr0rhAM4gKegTyGx3TaEINKO2DZO6PcTnDqv74stx1vk+peuPLjmHdkhD
 JoCqrHxvVrfyOVLwcVhW8vKxdSYb4peTWvEpSbMub8Nvrq0f4rNhcQBnPRmkF6jQ7Rq9CPs1KT3
 VgoGhXg1GSxTPDMBDnAe2JpVVbQaSqvgiXxr46CDuVjsGwhFeS1GPftyKJo/5Pxm+kYam3O76QC
 7MBisqAW6t4BbONg1Bg==
X-Proofpoint-ORIG-GUID: XYcqf97DCYAiX7YfIUgChwFHDBCWuoWO
X-Proofpoint-GUID: XYcqf97DCYAiX7YfIUgChwFHDBCWuoWO
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae43774 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfXw8P1H1VWv+BM
 XZOxTm3HeFVNEEjFbALjAV6tV0Ux3vXN9sSvHurQTagbgEhPRzAUi/bmWVgS4pyv8XjjsgiLNNx
 /YrGqffYdJgaGNbrB686dDHlHjZBeCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

