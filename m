Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC694EA36F
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974035; cv=none; b=kX5nC4CdlNz6/zDHR/X21WvmGcwYfjRbB35mtP48velhuZcChTFDpkzcy+YygU8M06szyq5YDt+ybNLgF3/sNQM9Wq86JK1Phwp86iyliWU/ADMdCVY+rOvV+XdyXVKfm87eUyObejpLVvKxTmA7wPciHMZffVi3TCV1uyiWtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974035; c=relaxed/simple;
	bh=enlVM5o+eEXbQXYD7OqYQYhRuhOUQDes+wE0EecL754=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VueBVGyfm5beliTsSP1bunccVyi4EHx/7Z4jZR2WsaeJBRxiXonO++MdGHrZAm8U3Qvw3MNwLRGUHA5elRCYyhVptD03caVaaeq7H7lQ/g0hpCDi31dnGBq2p+O4gccV2p4k4ezsoqrxIYtl6/krcE1iyu/y+iVZbCUWLu+IqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXsd4UPN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTjTiPvE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXsd4UPN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTjTiPvE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EARDZh466360
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=lXsd4UPNBO6/YB+J
	ilad8erEj3k3tQOGf7LbcAnMwELGx5Meer5u6USFrKtkVstzKka381wpZBezaLMu
	lW3w9yLFJ8RYkjHXUW5qj0UjShP6RnkL+7nJuPbwTujzpHPQX8lVmywcmJscncZF
	hbJ0cVL57R1VlwJpAfYGLBRhu+YVBlQcGrrJzoc9h0Rj1OXbh+5gjJ+NnYLN46fs
	+MjsRq35JbcsAZsp2SrGQbNsAHfVk67cHrmh31CfjtwfUmJ4I3hu2vAI12KfkE7r
	vUGWX8z3g0lPbmEyUNdLdG4aXYaVf0AVnAKEb7IN2neSd3jZVztcSo4gh+CNqA/k
	X+SmeA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr0sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3921951a12.1
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974032; x=1792578832; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=KTjTiPvEtowC7iIkRYxYU4coCaE2IzWhh3YEjSU6btXbUZC9wL9Edi3IuVF1GQ2u6a
         PbPYYBOSI7uv+KCtgCXpbWdoXCIDkXmBfzHH6zHNVceCB80qoIjHmnzf9XOPKGn6ogAw
         wpX2ht+LxecEhk/mik/l+4223i10p91fe9FiizgTqb+vEeMy+LDisHbqoXd/XND36VlR
         0+AP0Q25M+RC+1Gud8KYYhIsRyoAWy/XjiEQJeMUiISw1Pa096uhWrspZV/VQonr9jwk
         I8nY/z5dEVa2I1CnAvM1oKO2Jvybk83Apz2dKBU+vPvUfT1R6HfuwPcuwKAx/nj4PZdg
         2gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974032; x=1792578832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=Gfh/+hL7C4VA+wCXNb3CTQzQnZ6UuOh4PmSnDroDP/gItATjL0U/dMQbHeBkoeo7Dt
         imMnKt+tS6+6d97PTvtzapvY1s5c1TjlVsdMPTzibmpvBDKGxeHs3tJp0pYIXuPbuheK
         ikQ5yAgrl6oevu6AFnyqLzzZ72Ne808LYFVcVnWBofXAJP/JVAMeqM2ZnOAVywilax8A
         FRMPD+qWOzweXxqweL6sbUUMaaimV3nCOlKnhS+WswFICvg2Ksh/VIyRXqr6HLJm7/Q7
         XSFYlc49hdHgRbawrSAUM59wb9kZHCevjuWdn4dR7DbDVC7rCfgk1Jvr/nPt1YBhodrG
         uVFQ==
X-Forwarded-Encrypted: i=1; AKwUvByaea8CBUTI0UAtlA3wdI/MhK1rhWF3PR6HdIOO/hUIEg3We7SYVNYEP4S36uij52rp3qc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/8aeqlCCrjYUQ+Wzz2z9bOnRnt4shJWQlqCloE3y6z3HIIcb6
	XIpbDNahvc00UjBTwuU+dsDxac3NEtZyq3FS25lvmQxbE5+kJsWV/LiiM2JR8yxJEw58VYhm1xG
	Kiu1VXLh/6xJjgXbzaxycU/PpNiFV0w3UcfrDrN0W0iIIMkFGBkJ6jHw=
X-Gm-Gg: AYBFou2JInsrcFEfIkoWDQxd9JQ2KSO6HmvS7UAlWaN2emysIa029NrogII3t6n2fMs
	4HKiAaUVHTVlzkgP5cxYZ2PZyOr0DZeJF5vHOhEr7bUMry2wjm+fSgZ7KuH0cNTZZeGJuH3Yo5I
	bzXZf0DsXpPkgUJ9Pccxw3Csov4vlJeqXS57N7oCp4Gj1Ybnn5nhvOfdEXWabBcwa9kYtbw+Hqf
	i42gIeB7IjPN9nxiSEvK823ZL6oApYo594NQLWzBiUCNp+zRRLfNIrz4VfyBs5daDLRMVzdMPjO
	FRLQOOay+MAkxHwK7R0rvDTLkJdwiQxEkRgyKQRCvAhPPUlYW0soaT570zQVYgumKVON3RAMO7C
	s2giIWz3BaWmsD/hKHJI=
X-Received: by 2002:a17:90b:3145:b0:3a8:a62e:d6db with SMTP id 98e67ed59e1d1-3ab36f1a530mr10793130a91.54.1791974032232;
        Wed, 14 Oct 2026 03:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3145:b0:3a8:a62e:d6db with SMTP id 98e67ed59e1d1-3ab36f1a530mr10793101a91.54.1791974031698;
        Wed, 14 Oct 2026 03:33:51 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:51 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:03 +0530
Subject: [PATCH v2 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-6-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=Zw/Q9BnX6bpofeZoCCycn5btSpx6AA3/gXSih61ZP5aQT9Lata18DN8UkMSJdabPDQPEhRy1n
 R+frcNtudhyCJj1fXFQkwILIHsnWWVWoGsceskQzDdCXrtsYK5h+zs5
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXz+Es13lowj9b
 evoOpWbMzxBz/G6z++zikhGmX94e4zI/wET1F+/TtgREOs2Coq5KzUOs8lLFDNB5KYNBjr+tVx1
 7VG4qCdUUfJKT+vjPNOGgM4Nyugj1QE=
X-Proofpoint-GUID: hN6Gjyv4wyn-qLLr06LK2g-uiOc8N9h3
X-Proofpoint-ORIG-GUID: hN6Gjyv4wyn-qLLr06LK2g-uiOc8N9h3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX7hOJEdXkS6h1
 6BH/dJ9HMNARdWYPsiAeK0Zk3G/LtECxsBSjjt/QOdhyee9YWq+VBF9SMzaS/vJvX8TS6o6KcVV
 NRGV4j3lP0f7NmYpVPN5JOneA8qusL3D3v6hLZg9np3FgZ62Ftn1u3o52g8RQvme0aN452PavSb
 R2i03YkLAIVBroV4DEWa5ZRTMxuhyWk9IXuJ9C0Ql/NLIBqtMpLmjXZyvpchyJmOzkfj6FSXNdm
 cItwMAdDDEPU9FD0n3W2iTE1ZpM2FiKfb8hhaHe04x0erNh9MraafYXPyZQIyqZj4kJFLjSxVTf
 GnC9jTpT9TWJ9hAphFIHw4yC1wZKbGJ2lvs9e0si7F8uVRBS5woZ26gXRF7Vl8Q3+fB91zX/YKB
 aq5c5oAzQLagnJx1x4aXWS0y7o81tBXdlJFELvkjOf54OYLPX/MjKO1g6dRaEil7+CdVm6Y/jzE
 IkNhRTjAfMY5xx9knRQ==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf5a91 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

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

