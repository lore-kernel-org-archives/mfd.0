Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F8480DDB
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203141; cv=none; b=DreuAkKak8+6zQaC6z6cbjnhhTIjPX+pncusBh5607SnnhdsrYxtzkGYsLGhbekccsln2WNOPd4kwPUKUnl8zYReODojtUAePOHul/eESi/EnLyeaJ/1qfj5/cVbc3BgNtUnwj7UI3GtBaqMqlvqXxe3BqQfd0KWev/rPvJB4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203141; c=relaxed/simple;
	bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rG25F8Qt8Yi3NfductO4a9qLSMJFFIW5BobbPvt1pIgxEtJGflBnEaExnNZy0uu1tcUi1y6TkX8T4z0lG4HaTIv0iatFCbImwJpx9rr+5AwITJbOWzRw1kZu2J0+dOiHYgXkdbUZvIewjO8rR7F8IQVhYUMOMitGDiNqyYcfL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIACho/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5nBsDmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIACho/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5nBsDmv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFQY72225845
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=; b=bIACho/7NXdIu1PH
	1G4xPaMB08dTykt9/XT3oTfVXnk8Enyq+4I4aUeXrhc4CzbvXU1fxE5SGZtPcRsa
	yElcjvp7+CZSIw/N/lKRqi3y5zkBJBe5uJWPTgtEFxz9Q1b1EDj/FaYToMNUFgh+
	0COc9M8RvmzC8jZx2OxdSmBUQ5mCebYV6wcY8wR2ONNHAGsm0qV4HnIhG+LZ1Fvr
	YDRlr6pAhcBzeJcBSVsLeVBQ3HiFw+LmIaQDLgTtP6MlDpgGlkL8f924hTIz8ots
	6gsqxDR0BbFba8iMiikGyDIO2TvZJBytUgcE0+T/V7mBqFqMJPgzp5VS3hNNp6ib
	+XJFbw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg02dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:39 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-806004ec379so2485319a34.1
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203138; x=1791807938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=j5nBsDmvN2iuwBI9ohOuY5f7NJapERQi0NxOIRPGAWJw84NzT4KnUwpEZkqgJVRzj6
         67Icpn2G8uQONb8Agb7yxTIVq9tF9ju/6E+VFb50IpQ2T24EuNZTF0tTUJ943V7FtMhe
         T98j+QMNy0RvC3D6vG/k6x8fia3dymfvr1byUV1MRS8tjQB/oJE6GBrglhliEVHI/U/1
         TxQjD68jX+jVJUqdQKPVGsiyM7M+QGFEtPwJXRUBfzL5Kjxk8F1Fz0xqDxXju467cQqA
         OeW74PWnKeVyKmULsT9NA5tGgVsqpjTtpxfD1U9MIc4POislQaKsT+2/mjC0OFSXU+mg
         OBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203138; x=1791807938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5KmvAPHEvtXUjXY9aQX37naVvMh2wr2sNXxq3qQDBs=;
        b=dEMT+Kp9bLSmLRigtRs/KVDMQHpj8ZsTWw7uPPHIJibOeaZyXs+rq0zLvlsQyINMrR
         3GBFp1hHbGhXLzqursZbR+sRaHjRoBX1NvTDzBHoEczPZ+aZ7IEnw+rYWnKbR5l1lSl9
         5KEKUqnrcKDlGaEusmn8vp4dHD/hX0l1QYJDafMaweSzhrgTMefS1sKAjCHHCl6gZlxH
         qpEZ3+jEh7srPlTE0kR5wg1FZEZzHPBE6mjyv8PJsr3Zy3U6Mi111ZStSM4y9dNJivip
         mqm8Xju98wEX7xFetR1smq472JS3Ou87jTU/Gn7xx/ay0sExtrF5uROJ8hCDwakmZPkb
         PNZg==
X-Forwarded-Encrypted: i=1; AKwUvBzAIJiJ0WmYkWY+HqV2fz9Yq0kUeY6SzfFhGzef5Ho8EY+YlnQx1DVcEha5mdTSWPY0Dw0=@lists.linux.dev
X-Gm-Message-State: AFuF++mXwaKaCeuOIe7OGwROej7SEsFYPHhr3uninVymiYfRwOGz88KU
	69QcyYXBg70AYTsPWqJkn7sPd7Ey8pIMsoLihab+mO67ckPe/LtJfpO1r3LztJAgGZXWD1Azb0h
	XcESdZa2HMUNTeZdlDl45hPP0UEHXuSHHisXGcyAvCOLilo0QV3zhEDw=
X-Gm-Gg: AYBFou1HrNU3gr8QGWgjdfcr9VROIsJPOsQJ1qTUYjUVaoEQqjdY46CsinrPQAxXuL0
	1iZ6Hoc1n7O1DjcMVRnuFgmYS0ialKhsPMWo9EzmjIfc4beUoQpRsc6GyXfyOPZSXgYoIhF/S3Z
	yhZOSATmVyPFcNhQht2P+9l0Iz079P+uh8SPeyCNWLvxQB8bfsHJ6XcFgYjmbpJTp2Wz0VqFIbq
	T4c8w41JX0XfAHuCglyBWcj3QwGW+oF/6XwH1b+XTcTetDa7jXcF1RkM6GyYguUB9Ruhl+eBHoV
	QM2Vgd7KO/6q4ReVAg2JZQD/8uwlY8bHrWyCZTbBmj51dC+RtmKwoSJZ39/4QN5SNa9P4EtNBVl
	9D04h3uhn8KtgIm/KazcmvFR6u4n6+YDZOA==
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939100a34.21.1791203138480;
        Mon, 05 Oct 2026 05:25:38 -0700 (PDT)
X-Received: by 2002:a05:6830:81f1:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-82285a5a05bmr10939077a34.21.1791203137992;
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:37 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:09 +0530
Subject: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1189;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=WVv+nmg5vqdtT2D0t45asRyQhLWqhx+jIdJ9Lz55kMk=;
 b=e8l1k2detbM6njameVDRrH/P5djX3PqBAZVb8P3wS00EMPs9dUybaghEOX3sW6EI7fZ0bXx++
 CjMaS1zZQfbBDDLxQyq6T9+PD4Lx5cofzHLt8soCQgoiQY/lo77AtBV
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: XXPHHYEwhcUOtkB93vtc9ZBIx1CaJm19
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac39743 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXyWN3YgE/2CB2
 iOcVfJz4Asw9jbqdt9bc+V7Aze1tY2gdmWEyD7Jq5ccYiVNiPs2uvnup5cXvOJJihJWJm3ZbAYp
 MkrKKulxIusq0DSdw7ko9Sx6Y2QfcVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX42GaWD2XT1vb
 sWnzRj+kZOzkw9bJiH1m74AXw1iU1yNlHg9R8yzSlirJDHPXJKp792aAdb29ZU5jvfSQd72JjzY
 DT+g/n2VEKMmK+xEZUyKftC1HAAb3KVRdS8BT7uXcGvvhjTWoUzogPYGJ2D5H8Wxz6VCOXPkxmA
 HUGDm/7u/us+Ixtw63Mcs4cR+WuiM579Ylo311xdNzNGkgWI6azUlGAwMvJusZlrMCgALS0+qvC
 jagK3WrorL8F4qg7SKK1KBj3UghGjy8ug62eqc1I+YDoEARUHtpiTR2K8qvsdxAyggqjFogtnTI
 RZvBbtzXxMKxfx/DMEvdWl0whiaIkGaOo8rCKXhVgEaB9YnopQhKZJ3XVHl0jGfKz2Kem64AB2Z
 QKfr7Ewflxtd2CgVPheVgy9+BGop+M68mAJld8fUbJgtjt1ibNYpokLLqZa/pKtkhXY91eNvTXn
 iCEJUOq/swooMi2KvDQ==
X-Proofpoint-GUID: XXPHHYEwhcUOtkB93vtc9ZBIx1CaJm19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

