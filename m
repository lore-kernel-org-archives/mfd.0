Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6B43914FA
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750369; cv=none; b=TspXGIugMKE7+US46QwoqgugplHQXjBS0GHpSOspnJqZ06ch8YhRNqlzDWVQ8XavMCoODzVkhcIe8/nZb6te/S16NP7/eLnReH8cDL2k2xBiLp5b4fNI1TBVcrjC5VyIBQB08IONUhQqRflI81zjnd/NVFbYYjGLlFVP+sjIKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750369; c=relaxed/simple;
	bh=a4fxcZei+1h97cnUB4Koj6aUmwrxpdQsIsCANK7Zphs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USi2Mx8t3q/NPLBd8e82d76+6V+/kGDuWKptDKrTOIJkELViOZWjE8Lxc6KuicToLr/bQ8ANLbpBW2GXqbPCmheEymiC+51Ierd4Ztwy6UenemTQicCGxDjvO34dfSXw3PHk80MQcn0MKChG7/kEihuZWTo7sxJEG3EkNDyQ37M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a93+VRjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWVLoT/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a93+VRjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWVLoT/H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sSbk3790719
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=; b=a93+VRjpDeAHhX87
	3lzQVhB0l2nMDdMKZfqsukZ2ADuleCH9oXvv4hc7jeo3QfbkmrkwoH58rGCYt0pk
	2xzWeP+aoKi1oCsjiHwrjfRx3wUigHt55EtszBCzOhEsURVYcPYvKajmJWcaTCrr
	CXsMxqWoV5a103PnVnIazeg5ssbYe4w5V7Pr8IGNR8G/G7lD9PUWxqhKH+vBA+Vg
	AFMCGqXnpXAtYMZJuS9om4czlVlRSpvpSgTBooF7ZqFy/MlvOkBq7KlYDcBFbfWV
	IckEDfEB5OT1BWI9hHeMkqfpOd+iK2GrTjhfaOZ5G9e7AVB+kDwiCx77AiHXpzMI
	V+iIJw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0sjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:46:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso3178711a91.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750365; x=1786355165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=;
        b=DWVLoT/HJ+oDtg/++VX0ckY5mNnPwYRgtxogzRClp9E7V/AuVdwq47tPWLLX4eqksL
         5P+EvfuPYbbyX285hwoOxkLXNdH4PgAajGgccV5J3KaTak/n2FuROZC6WXGSo/L+4D3b
         tbzi3JkN57BWJP6lkCAA4+JrwQEmFZ+Ml/SgS6mNhPCxYjGUfvzrkHfX97xBpm8qk1XH
         RYpdsj2SAzdJsqc94qxdurPicKDOFfzoZYqvTW2fS1A7G18m0IOfUK/2+UI3fyNKGWur
         QIhmATEHYcysSgbFriQklL0+u++BX6+sZtlk9UQZe8J1kI10KCe7ZX7i3BnIj2t04DOM
         r8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750365; x=1786355165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miyN33yZIoWSSdkcC3toNxzlqXgaA/C5AXSlDcD42bA=;
        b=YOmYQZMg3Lsq9Z2LY1QnOKDCHzbBQRGboYjFylAyxlhpnS+vnDUAMxjqE6ClS3CgFg
         5lYOaiZTiwSIn8it/S7KLCgmbHp+t0AfOR+mmQjTdPhS8qL1oGES1cu0dVRQUl8tZzUI
         sSuomwTWPIIA347T7TAsd9z6rXHj9U1AoY2rFdcXsCG+D4OTReI1KKXABqsyaS+XxYQt
         xsxWmqeJ9SJWMRGkDDngpUOK4bNNy9zbxIVMJoqm7wNdCB75Cwjzs8mMIwxJBkHpISRX
         yNvqzJTQGDSbIUR8HdIFkmp+WLJf2S+vjU0QVIG87s/PLWmAVKZNQmMfxF7XhYNMBdvA
         C4Ww==
X-Forwarded-Encrypted: i=1; AHgh+Rr10X8JRB3UhizH/CAPsjq9p1WB6O0XqpzpKtijhxcDA872SmQOh1yTcO5NtsHpFsU/8ZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPlKEz8sXNCWj5lwxpEOxoomSH5j/WNPrJmFg998gGjssID9Ua
	gsF/cxpAspuHl5kYOevTYjs5JTKNNyRwZsZAmtE5dk93qpk1T27IaM3SkaKwxYYgEBZaw3GGeRm
	EpspR+CCug05vkk5yUmkPZT2NanDi9lHgXWrhMhsn4dySk4DFRrwQtOw=
X-Gm-Gg: AR+sD12S3OXy0ViaydeC3nPhZgoymV3kqswB7c0SWnpE8ayxK31X5vG8A6dA7qZtPJa
	TIxWscWffD8oAnwyhFqeZOLSpPenDJgLO8A8/xMxiGoAtNiXYE7QUhTRym25esbWRePzEulbBHp
	n6ey8Ej6F8FRpSngMvAg5Snf9DSntWfXm1jxEQsmb7KVH9fcezm00jYBwmHNGfWiCR1333/lTld
	MX9gY97bI+28BIhfv7WrHcgnZu5nuN+TrHLs6+l+yhv+kLSuuT5v6hO6VxC31txQzdVvIaLh48Z
	2DyJliUiFhHT/5TRI3MLt858PnqnwRCw/km6bt+TxtkvHIXCqgfoeHJVubPXpQDhPg468+1mVUV
	1zsy9nuwtmUdqQo6vl2qjp/rr68wjQ34xrO9T
X-Received: by 2002:a17:90b:1dc3:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38fbc554637mr8271590a91.40.1785750364999;
        Mon, 03 Aug 2026 02:46:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc3:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38fbc554637mr8271557a91.40.1785750364566;
        Mon, 03 Aug 2026 02:46:04 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:04 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:39 +0530
Subject: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2310;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=a4fxcZei+1h97cnUB4Koj6aUmwrxpdQsIsCANK7Zphs=;
 b=6PUWyqdZoXA1QuaysA36vs/XHvAO2olSJrRMhPgZHp0LLLjlf15a6Ar5oPcErXR2QVPoPKJKw
 fm10+Fms55SCR80ZbNJ6JxxIvTiBOyaIWQ6cBXZoRzudw1S6emdYjg+
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a70635e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qQQu7YRYY0fa_xNKXW0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: xT7CuzX_oEW66wYilcg0FPuWICXISSoE
X-Proofpoint-GUID: xT7CuzX_oEW66wYilcg0FPuWICXISSoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXyv/0la3B1Ibo
 Fgcbcs6yEPy59ya3/qIzc+/jMhQsuXYSqiooc4w9Ak+YIrpJMbvG/+rdpZIb7F6cdnV0m3ZSxul
 1AP0gPmwNxDdaWnq/SfXQH0BEC8GOyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX7LYhKZcqP/oF
 aEJM/mXoOgDkcTT2gmIeh1AOUZLeaOB8I2Zh67QQSNxnrfMkkuLmDrP5Fo9CuBQDavsKQM6IKg8
 N4BGf3sHahypv+SxvNZ1YGng91PoRygKHeHwojWgUZo8E5zQ4QtjRpoeAY8nNFe8x2SpE+T3Q6d
 em4IBOcBvQY4w2bBHRp/OAJH4gjKV7JufrwL0Rhf8zwY9o4DVHzL0P9pQCbGL0OGCp34KtEoDyp
 KLEl9P8GRYJQexKBU+GmYyRj32z64hYVivqO2aGZTjwry+Td+0lcz2jOcIXp0czaxmshIY7m3XH
 Xg2EInDL5eUWfZcpCyhB1KbDW5/ra95p3LGMNvRalr5sI6FCDTc1dOYCvH4u/D3+iqNqMuFeDpB
 FGPv1NikTwu8TVnCDVPnEUuVKn6L/3/NiH/A09oILC0OxYhG/EMqZCvnkJj/hRD553AKvcg54sF
 olqwroeL4Rjz3vQw6RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

The PSCI "reboot-mode" node does not define a compatible because it is a
configuration of boot-states provided by the underlying firmware. With
the new firmware-node based cells in mfd-core, this node can now be
exposed as a proper child cell.

Add the psci-reboot-mode child cell to the psci-mfd driver with a
named_fwnode. Add psci-cpuidle-domain cell first to isolate it from
reboot-mode failures.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/psci-mfd.c      | 27 ++++++++++++++++++++++++++-
 drivers/power/reset/Kconfig |  2 +-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
index 7affd6bb09dd..7befc4fa86f5 100644
--- a/drivers/mfd/psci-mfd.c
+++ b/drivers/mfd/psci-mfd.c
@@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
 	},
 };
 
+static const struct mfd_cell psci_reboot_mode_cell[] = {
+	{
+		.name = "psci-reboot-mode",
+		.named_fwnode = "reboot-mode",
+	},
+};
+
 static int psci_mfd_probe(struct platform_device *pdev)
 {
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
+	int ret;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
 				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
+	if (ret)
+		goto out;
+
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   psci_reboot_mode_cell,
+				   ARRAY_SIZE(psci_reboot_mode_cell),
+				   NULL, 0, NULL);
+	if (ret) {
+		if (ret == -ENOMEM)
+			goto out;
+		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
+		ret = 0;
+	}
+
+out:
+	return ret;
 }
 
 static const struct of_device_id psci_mfd_of_match[] = {
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 143f3260f04a..1810482d52e6 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -362,7 +362,7 @@ config NVMEM_REBOOT_MODE
 
 config PSCI_REBOOT_MODE
 	bool "PSCI reboot mode driver"
-	depends on ARM_PSCI_FW || COMPILE_TEST
+	depends on (ARM_PSCI_FW && MFD_PSCI) || COMPILE_TEST
 	select REBOOT_MODE
 	help
 	  Say y here will enable PSCI reboot mode driver. This gets

-- 
2.34.1

