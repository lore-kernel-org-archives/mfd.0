Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12144440621
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768867; cv=none; b=YqsIelk2nflJFW3zhwzvoNyausTm6hwEgZBAenk6sg4Nqjiq47FhNWBx+uBIxnr1HUwYhQIiLYbwGhxLdfRMmixIe+bP84pdUGx4FcIzvHZwTmQ+OxrWDSHDC7VtFW1BIjB4fF2UWrzyB6VruOEImPYz3HgM8xR2UsbpiaKaYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768867; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jd1ZGwbSHs5sk/81ph9mZ6fA104LDjYJHXe8qsI7L4mFqQk/R8h1CONzad1Ul/x6wW+DqS87R8ToC9uxgGzCHIXKJndxl/IcnAONTtzUPrKJacOkWmVZ3ZqXvYvooKIPnwAoDXP3xRFTC/WP1DVIUBzvC7kR5yeOE04O8BrI734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=px5URFKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B6AjoBtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="px5URFKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B6AjoBtd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XRf2668279
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 08:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=px5URFKSWcpFG6By
	FmckY/GfcrBuDS1zDFI651u8zA7Tnoz/3uSRNgMyhqvk0GBsmxXbHVR7XcGGQQLK
	MQIr53YuDCbGaki8olRqLIb+M4fJ6H5ZEKqSApoDAgL1VkT97lB54z+wyuTrCk7V
	U7n/qeH9SNgEGlwz1M3VG8MAygO/eZ7cB56QZ99KZ3fWSv10G9T/WiYsUAOdhIxI
	LT90wKqspZ8kpcVhJEsUtsC8UXNFBC4/wISyffFH80Pqy9EYLc1eJt2TotH9CUV8
	Ty9rz6Po6hYLQYj0O2xWFStAWuzkfz9RuRbXQlv3EgaqDY7OB707oOhA4XYmZoYZ
	jkdAxg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggcca5q0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 08:14:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so4212934a12.3
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768865; x=1789373665; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=B6AjoBtdntykseazDqfUqekvyoN481/2ARBPSIHeiKarw8t5crbqd0j9eJY7xCd7/0
         qMMR/9s9/b32MqaHk7QMnX3zS4NHvfdGEztxVtP404wAXnqrTfbg2nvvfA0FPKVO+tmg
         uvq+1lPhFo983RGLdSMOWsh3XDY9o+WDIRN0A4J/cwg4Vs9fWhfs2yZwjePES2Y0bC8g
         JpUxuiDT7ZWeMOB9R9gVjj60DnfEMWOucPTsIgOe1lFJyDMWAYe+OIjvi/tFNDf4oqJy
         VROK/yyjhM9kPtlBov3AH0rJ1UWgLZ6VSqbo24YKSUxJc9NzD5STxOZCXDvc7OUyKDQw
         jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768865; x=1789373665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=m4+yfJQEwvIg4fLj8so5dULsgy8xTCCe2UNqdfnwhW3+fJmufDSfZupePeDq2sbItf
         TQ7qkttJQ2nRrTR0tsAdGM3RvZnuBKyiGJrDScaiD4V0mF6NLSsMhkphv6QIBf0nFkWv
         Up3C8LtpYs5wSXr3Ow1IU2R13z7E0NjOt1YY5ZWnLsJ91IyrctcJ6jHMlwqFWx8OYle+
         3SKgr2KUS+yvtFcy+jWklQgyAGKQyX98XsaE5Yv1c4qKJUI4a9RvJluZufBhSPFs85lX
         Cn3JFEcAglmOGpi134zwx0i1mGvSZeKY/aOwKH53u1ezdoza2yGQn13U8rSJt2u/5ffX
         9L6Q==
X-Forwarded-Encrypted: i=1; AKwUvBx562TLx5iEw2QPNC9DhmOjx0YGjGlBG9x6pdiZV0gBTVdWl0IH9uAajbtQQmDN5VYWaCU=@lists.linux.dev
X-Gm-Message-State: AFuF++lLMUrABpWXGGHWnpE71llsV5N7EncycswiEkd6FIQqRXF8dp+I
	aiSras0DiGMzaeyCJ265MMel9QigTH8xkKhvkXUkmWGOOqmZHI6yufBXPYXLDcDFiO3bUKFn39O
	WqIhE4K1oybgRsiYbw+7jTGjEx3tBhvIa7AuEzDWmVvZtDdYTVyEVInQ=
X-Gm-Gg: AYBFou0dph5ojreDEW/FkPRm+CKlVFKQfDxth+nW9e1XZoKirQaQ6qVh1wH51oj6vA0
	taf9WYoDXXKXzXaP3hgNtLrdYlei0IeTn5IGDG/GdNztb/QWhErrXDUg5/fsiiR319o3F675tfS
	WrJaqGBQt/R6enmviT22xoMEp5ffrnCdWStXRfbdE+QFZxWhQDRDpwNcDR23EPS54nZf2+DWbF8
	/uY452SmynaowYasyCFN+XwL6JqkANxcoTmgZgyUDX2rQQAQpQriOTt3rj18A9DebCCQEKO4i+F
	PvW2j0wv8Ttvw7qlTNQVjj784XtVRDT/KetbgrN5H7fMV1PFbULUthzsUUcHWUlk03dRZLG+tIl
	qXpxP5S1AK3BkWRbKfCx4OqxA+UApunM=
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155509637.14.1788768864533;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155432637.14.1788768864089;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:23 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:40 +0530
Subject: [PATCH v2 4/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-4-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=YMrJpmRfjIqlMxMZFYjxewBlzaJz0yE8Svh+SnXsf50kXLlDnEh1boHaeMbt208cyIv0G7d47
 ca7rrOzp2d0DLI2LGy81N+OA4QSnH5JSZ7yqaSwj0NSx8tSH60m0tuC
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: hPxbW6JNajQeCqD6afDALTARAqodw4Ti
X-Authority-Analysis: v=2.4 cv=EJo2FVZC c=1 sm=1 tr=0 ts=6a9e7261 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hPxbW6JNajQeCqD6afDALTARAqodw4Ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX8STUcsk25Wfw
 jwxr7mkxJn95xp+ee7kBdjxvQMUT1KCOTJm5kBzzX55GL5FfXchEw2Mra9DRADK0psZN65u7iSY
 DKepeAMUMwKAWpaWc0Sg+p4mUGQoBqmiCkMfJxrHBx5qBEsOX6p3ddiocELGX8PRNlCCNmbvB8Y
 70dnKj2QWpPiuzH9Scf964mcdO/S6fxs3+6GjseaqPWTYSoa0+EKK9SYyqDSGIfmoEX7eaK5few
 uaJaIqWGRbvPasfyg2jqY0Jkzy6kwPv/204twi5txTuZtKU3sK5cCPL+WSiScVeBjcpzQAaXF0/
 /1ByXOljka5wUNFFQH8EA3xvKitEYr7Ohhy1kfNDGu+bcrZbAODGzbQ6xOWIc5Omf2vqXM2Uz5D
 HkoHr9AtvORN4vjaCE2kOLfVmCqJFAbOmyNzFoYUzchIcQUj7zefJExUaMWJiSxNq/H36mi3P5Q
 GWmcd+BXD07a1uheQrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX1o0/7Gaed8Nn
 qx8IsJh5P7N3pgiNzqZML1K9a9TvJ/+dNQcrAIOr1vPvoDOtsB6+79FEcHh7h3hguEZ28QKttC8
 vIV4wQzVnUhtQiqG0zuD86AXTN3s0SQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070088

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

