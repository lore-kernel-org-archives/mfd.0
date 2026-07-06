Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B534EA381
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341971; cv=none; b=E+erwrM56Y92Mf80wLAmdPDSUEep9ovFTafACisK34mvbYZbW8pCHsPnW19IssHsrGd6m/lag4lP5IanP4SXrNhQ/KP0qcyYnBoYe4117tnF3Qr/+MF9knJIMCQpxSy15tpZmHoMt2loWR+QOqf/gcJDmcO17T8440gFoj8MAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341971; c=relaxed/simple;
	bh=XyyiviFbpKDvWYZ20ZXbahVi66ptZuiXaKVx5fy/wOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clguvzkRuo27GWSsfWXHJ62GHdvSIeNOqdv/khMnkMRF4kfoopq5X3vRswwGSRbHyFJe1pcB0ys0BJIjlPunArUkKwprZdzowZSckOuqOfXEbfX3PtO7+B+zoVApjTjb983agNH4oArMQ9HO7Ze3xuHcxHPuRSzWTzjoKlk8ZLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAHAxf1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ma45KL2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAHAxf1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ma45KL2q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHMi174778
	for <mfd@lists.linux.dev>; Mon, 6 Jul 2026 12:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=; b=cAHAxf1KaFEH1dEa
	Zhonjd8lqW6rXiguep/wVXHJv97/js8xqR9yyptCdQVInJaPAnBHvZoEKVIGZG/E
	qgSF+FHGlGvU6aovk1R/J/uA0v2CPgen+Z9mAC3t8u33m12/GLMnDgxlwg3pE/nH
	zqY6fTyIULWXeaL6LLn37EhcKQ1K6A+edqKbz+9tIvAfqE02EV14oNcNACqTDRi2
	TM5LzVGESUu+nlBifs0+XJ++JRYAw5ohDvpImiOvmBdIDVK3k0geXaXXB8IvY8Vl
	pDe267XI9IoHGh6Y9KN2BD5bpYAi21o0zNNM7dzMsgizVN/2D2h5RThVAqtgzAKR
	eGj1ZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs9ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 12:45:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so35213576d6.3
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341945; x=1783946745; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=;
        b=Ma45KL2qmdxNfvU+Q8g8a5O/OTJlY7ktEox+W1YcvCSoZ6k7kTmYsHNvNAraPdGcEs
         N3y2fskKCQQb0/QkmBVCR2oXuBqU2omsOGcGJz6eUuF1Oz6rYFyaRx1EPswU+eqOBMXx
         GEID9ALzP0B3b7jYwcxpmOECGaw7JBWFF0PTN2hRZ2OOKJ7lI16wljZERJspXp4nB/Lx
         t/iiF7Uf6r2/Mf4GfJiqJZ0w43HV/FXu1F7mYqCpxyqUuEvmPltvJrpxS4ucDv+ic3eQ
         z2Uxh1FFNkeKKQwzEgxClBaZtl9tUgvG0tSFsZKVlBHZxK/XkBTiKKLYB/fy/3IJ1Xc1
         Zf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341945; x=1783946745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bw1TBf3fi+dzITRL6JxlDKqLulHveM6zognFCNzexM=;
        b=BrWBG3ZnVsnh3Z0V9QC0m5rDW5hphOwYSaY9n4ABVPWEkOw4B0ZsgNstRaN8LJzWTz
         cuSRtVzhne3eTOKUbBywXZXMBsN2jbr6COt0DNXumdi451f4l+d2WuuPliOSNcBooL1h
         DYX19cn8VblYoF4W6D3mUwxwgxncyyp3XnOVLj9JO7EcOftjgM1gTTmtjF+2af5UzsSE
         2WxlVIDHjdfCFX6S3J3zYq2DeQwXPsmtr5LamvFEeGSONuXSS9nZk1h4lPbwH9bX4WXn
         Fd81k6JeJn8gR0Nh/+p8F1BbZi0mgHmH/oAkiNGqPVH6hzglcQ1rF3eWlbv8ShuMD4ff
         ufYg==
X-Forwarded-Encrypted: i=1; AHgh+RqlMYmnzfi5VvTOHCeQRyMbProdDL99hsptJIW2+3jK2oyd9HGSFPgKyEc8pP8m4XWgT+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqFdrD/UtyIi+HerQfcJ2fP1AFmoHFWUTE7+IqQfQngOERKADL
	jlrT3jfZU+4M3FAI1+3YDH30G6Ck8ucVfM+/u5XJuNb/Fbsg+wX7W8+iZvHewzxk/juA3b3A0MA
	3k7Q+fanAPNHlRuQtD0/t9nHr9OtHgxp1zmIaxoSRl+P9nnUPEf6mlLs=
X-Gm-Gg: AfdE7cndHhAagrNDkA3/gBt20UKG1YITiXdeY+wjjjrG5TRqFDHnXdJb0zxCdXKqHN4
	e0ZGULNUH3quFeYx7dICmPk2umNYQBcJ5PvopzHZ++6H7X9WlxcnXiOJczG/t0EzUCj1u1mDTnA
	P8875aTbKEiktTYv42PSGhkZa8noAXX0xmCfMt+2qFKrwQ/KZeb72+ZN3dCX4dpHtZnMAirXyxD
	RsWbOsc8yOK+9lUPV7D9MrKv99vlKdaB9ER2lztVs/jct9f7Q517cRvreCs1GtyYKMGbfIPuU/J
	po/VsySwdCvk230e3lWEuTdnnx0/vPR9iiD3GKF9dmj/ZufkXH5zUii1Ds4TIVKlIwarj9bdJVu
	Pa6bJ+GoHVmyliHWcLSxSMf71FsyNr2d7Z8YaH6aU
X-Received: by 2002:a05:620a:1a19:b0:92b:7420:bd5c with SMTP id af79cd13be357-92ebb49abf2mr55504185a.5.1783341945051;
        Mon, 06 Jul 2026 05:45:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:92b:7420:bd5c with SMTP id af79cd13be357-92ebb49abf2mr55493985a.5.1783341944411;
        Mon, 06 Jul 2026 05:45:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:30 +0200
Subject: [PATCH v3 18/20] usb: musb: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-18-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyyiviFbpKDvWYZ20ZXbahVi66ptZuiXaKVx5fy/wOE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M8unH/9uMVuERAbDU7JQgdVNpF477whb/qV
 h2sU1vkV0eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPAAKCRAFnS7L/zaE
 w3ASD/917v/2dp9sMu0sQ8gKP5j4d3vmNIIb1xOTgzEHqv0OsHo3Lb9hyL7cLuo7aJkCdKEhLC+
 tyJ8mOcyTKIzMIjnNz7P46mrgIH/Ez2a8MsJaJNtUn2vm/TdGDsp6oD0Z27+aqXvIIBJ1x982k9
 tYW1zaY82nmZD4doBZESwvmet+CCcH4uFFNRXKjknczQUi4PR2ati7XYXfrvn2JAvTNfnOxiFXu
 +SrK4u+NByEBmygBJuoyXbcpqkhQ09hZTQeyT+0mwp4oX468xnNL3RXSyFpg3qy9EUoDtozrmej
 1/cpGxHdGtr++fX6VPEA7p4WO/hAcEgCd5MjXs2Yrc2PMwYDQivAniA5hYQofIrg5nZQKJmLY9F
 QNE9IhjwU2eo8lhVzgaG70/sH3LAdFOXIcZgF0m8xyobA/nfvsy2ZISzyb6muZr016il2N5Sk+r
 r5qk3BMaeykc+A5j6xoNzT5gz+bPiK3MPqOyAq6iir97S7ZSS+X/+jwqd7uHtBp2xLe7bxNAHQk
 N+3c/OzFA1YPhT67cX60BoP9wwOAw3IRlBD23N8m1G8nEzViIeMSygW12u1/EWimFokxYzbDni6
 pz5ci1zOxl74U6f0ojOB2Tsdx5nRwx125VBcJdikdRrs0oLWZAgJnw7SnYRMJAAW4u4FC5vZxEw
 bhsT20MM2rZ7M7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xyI2IJdOZnGNLgKkWBMSsjL1SsqM6Eg2
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba37a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=ndL-XpQVcrS1Utx7N0IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX0wv/YnFk4URk
 dPIGWCOz0Frk/GjycvkO5d80VYSs60Fv6poPD8b1e0af2x/ZlpQIL1ZbS1urorGvLuOUN3xQCjP
 pewmFoz8usuJ32xq0yQnlj5a/TtVnhE=
X-Proofpoint-GUID: xyI2IJdOZnGNLgKkWBMSsjL1SsqM6Eg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXybYkRvLpa4hI
 xA/VzyGcJvtYNr+CKuFne/cnrNsyr7Uc7QfGLSK1cex0X+z5qESVD/HsUydl4IOGuFPqVqzILVp
 iKDyMorTISNuz/mLysWQhXA2EKddXyg6v6LagwMXIF49FVpi4aU/+WdqBocdJwHtCCfFz6MtxVN
 /xtboAh0tboMJBtMxA89YCS7FAQqK1+96Sqs1MOELpIoe2SqIzpJv0Vd/73cvexBps0KR928k61
 zXAkhH7ql1riLDiMDlr70fMwc8iiE7QGaylPa5g/BcsR44sIYbVJMGenoujbe8axc4DsP+ueYem
 LO03fz7E/DgbZyKXo9ZkndS+cd+son1y6omiX6aiUCKbHzXyvUCHtyUcmUq7YaS8liZXLtcyCSB
 IGn86XwdvcBajxfPnsL76UNwMuhoPRp50Su1+aUlEbnjx5gfqY6teKchjp75H6+wokQntXOc0ii
 xPsGZR6WYIuYJhusnZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

