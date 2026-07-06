Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C04D8DBC
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341960; cv=none; b=l1AvGEN1bFGtbuIdby94BVFZHkHsMwn7SV86d8SgcNU8JsBKNkmkNhlSdZYquBSq2yhq5RKzeXUpcB3Dkwm4uCtSO024HuT0tnzxdv9hkQhIaud/z3bMY1twUge2HJxVVCqKs145uryAd5jf1c3rg3xnmSK/S8xLxjTFkuYVeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341960; c=relaxed/simple;
	bh=Zhi+F3sSWgohZECXWnDHQaM+wwr9Sm+ARxs2xrHRhPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3E+O5C9Ho97DKsPzl7HEpeL/ltG5ASnCIYVA5SgiIk0qPUv60UChnbnWWeC9sbEGvtmyakDeI5k8bWIk+IiX+oRZ/hGhwbvwQrmFi61Fv97WEL00ugRDAUfIoQHr7rXP6JWNJHuRlItGVu+2sXRh4hA4M3eyw23mKMpcT60e0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVsoom+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFeYl0mV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVsoom+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFeYl0mV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxIvR387418
	for <mfd@lists.linux.dev>; Mon, 6 Jul 2026 12:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=; b=mVsoom+I8UuemRAx
	R/ZfNmuKeVyyU7qCm1RkTJyHry5NQoN5fYILHYU8u/80eqT660jk7F2fx5b4fsG/
	zDcEWZhwaDjuE5F1BLo/UDOSyn5DHpnJGIU2GYWrZ2X5TlRuAkUa+Fmc/nZ6lZkd
	Czc0v7XG4Kfakwx1c8TbHIvgLVi9Ltj4g6JI+XTc9cNxLi7ext3cI12DYV/oHmAD
	2GDtb4/5k0DrTL7icyFt8bynGV5tAXp4iy0WZyNVK/xusG4kbML2949Yl7shJ2zH
	dDcWOaMsVzDH8ZQeS4yN7Coed1mAYEXBih29SLCoW9NzXF3aPqUjdRfp8t1v+uj7
	4pLhBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0mmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 12:45:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so213647885a.1
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341928; x=1783946728; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=;
        b=UFeYl0mVdwDPQFS7VcM6UUfQxem/zouMQYKl6k3VxzwHVg2AcNqBF3Rcm5pL599546
         D8u5lHUJTeZ0v/DzpHootUuXBjiXF0+5pWXTg3AL6i+ARMtlTLGdKhN0HblgZFSkXdPu
         fTnnRjkvL9fJN0IwJhx4zlvG0hX2fPV7dFvSG0vdXYmgWaR/GOP4B6zcngJAJ6ldmjt+
         8OJi5H8/baLpimTe4Eb2rf57CoC9NqkreYFSHdsmXoMf30e8mWt07Gj2tIvDMqNl75Bi
         cN90vkkP15peaHBEpCdCXZLsAsetdjouyoarUrhPezWH5h1tP7dVVjZeosuJnd/SBJz1
         T9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341928; x=1783946728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7M+qB1wtuA4e6xlSP5UxgmQli1U/aUaTG8atTWdnUA=;
        b=RA96dNaw8bKx5UzH6HClHPsxMinJkQBS+kjqK8aJ4cCUzVMddwKvVK7s89rMcFz+be
         zBo5XNxhfmkn3NNu8sv+kB11XYBN6P4q4JqsmgNTvxfBvHZKAKNvyuseL+ilFwQp+PH0
         2aDt4jIDANppTPCPBhw0Wko/arrdupPswvZGkP4mpfAKqCHlZqW+WfEI4/GqgzZ6RIU7
         aSa3KgsjKb8JiaxA8c6tIaSWYSPY504bO/GoaF9A1aZrujEfHqcr5Hw17ktXxJFmRzTS
         XvmPILQD1R/q3cIwL6fUusWG35drT1MRjhRK2yByBCezgvpGK1LlxGkSu4eQRlng9qFj
         Pwyg==
X-Forwarded-Encrypted: i=1; AHgh+RqduUVDwDkHBliwRktRkHCQ3uK9tzNiCoua9xsQdJUtcYMy9DnxdQIu9KOCBjk8j8LwmBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXO/uTMtmDWk6umQjnKpT2kz0FnPqM/IEaQ1rP51Sblofs/Fr5
	/GEUWibMOyYJLK80y7OnVHIP21glUCVHiwv0K9IhhBGciCehAyPh+Z/GJBhEiO+ER+YdZilehpL
	hrfvAAuj5k2GtObWXuIYtejI02mncP6jUEh7jD+riqNxpI3+DQkOrD5A=
X-Gm-Gg: AfdE7ckPOJRMYCuRThaWT9lLXyoAGxxzhkmn9LesyZTZWFDuiKStXlFMIEnZkxVHuUP
	XuuIUWqWVRFXBdAdoNaovtJnv1Nr6XuVCj+7ll+L0/X+kfPtp70FiXF9NheU+sXomjidmJ17hG3
	A64nxW1TS2q2DfWKzhRArxZNw/kmhDMwfkunXVh+FOrYAAK0I/73UaRk4piVLLo3rA4Ln4vOpQq
	g3M7pxIRQ83nkTLlyAlU+lWzRX4d+yA47bLkaKzPrymE4DlfL/8qtacLRaGpUuUSS2SYRssGGep
	FXse5b1lDNSQoxGqva8I7cmCJ1ixPaiN9qFReRLwcD4bF6MJPbpkvNqtjSHGt65cRT4nj7BIbWZ
	/sjiLtK1My5vIM6frrrKBz2ZfZ3pR8nDaP2906gFf
X-Received: by 2002:a05:620a:29c6:b0:92e:45e0:2588 with SMTP id af79cd13be357-92ebb5903e4mr47959885a.55.1783341927465;
        Mon, 06 Jul 2026 05:45:27 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:45e0:2588 with SMTP id af79cd13be357-92ebb5903e4mr47947885a.55.1783341926531;
        Mon, 06 Jul 2026 05:45:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:24 +0200
Subject: [PATCH v3 12/20] mfd: tps6586: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-12-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zhi+F3sSWgohZECXWnDHQaM+wwr9Sm+ARxs2xrHRhPk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M4FydUTb0fLA7v8UHs4cH/yNkk78x4q5hdy
 wJhY/6umy2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOAAKCRAFnS7L/zaE
 w2xvEACFL1p1phfk9S+82M3HHVOICD8gtkblfhA2UFHpFsY7LhbJmM/RpC8etf2XcuDnH2Wjsaa
 7ugVGwdlyrP3oStrvCOD8hXv34YlCuu9r15uW7DIuBMUQ0lVsP5/RhYk6rI4lX2yJ4Mb61Yu4yk
 +ekCe2PEQIApK3zi45KvVkl+eD1Yz5aiXqc1aNNOVzgJVlYnGoowk8R2OceFSR9D/OSqK6etbgK
 Kg2OSZHlSosDeDMFHTbBcdfL85jRxwk2wyu2+M/V/7sFis5TmdnqjShyf7zAbDJVmKw3zdjM33b
 TgzYM80W7O0nZf0BT8iFML0Ky3MuTWgC8pt+K0WOjpadEZ3I5GmWZCRFFwbpJLIy3NXFM0Du8Zy
 DC4PlcROsGtdVB2hZRMg7Zy1kZXbx0x6NmiuaKrVjT43h8GUkrK0nG6Ap60o9hUG1/pm4deMDq2
 0nz9SGlgZKIm7UqZtXAYo6WvpHEhEswZBQXybaG6a8CaFgZCeitbc3tH1tofpjPSXP39Iqxq40+
 T0I2ZAKLZFj9oQfyLF86bX3ET1D7rwiFZXwxCvzfI/YomTynpdYJ53ELWCvRBMznaosXCTH3BE1
 /qjZfJ+jeUZHYjhdjxciVXxitOM0ZToEZzwj1w4IfNVjBkOJPCYMMfz2wrFiRzmUMDZrKrI4lh1
 J5/eCP0vP9uobig==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX+g7sKYUXmuDU
 fdhwjt2TdJJH+MVlaYTVpDN4JjvWjDN12nWq65yuwwzN0lTD1OwT4LkrzMAqwPBa7TLC7tqycSK
 d5ynX8Cp4dNHMQ816bfK2Dxh/9COnYvqgMqPrXjGH5R6zIxNaPx6Z5sqnB72RUe/IQTql7cT7+/
 O2Jg66Z4Knv+djosEe4az6biM8iZbleP11JlFX2AVb9X5j4wqHGZL1zc3/g3/k84a8RyUuNSCbd
 Zs0f56YT5z/HTph5lGUHUoeFCWWrPgf8nVVfP7NYiDF7f9ruooTsIAsH4oUY4WaQIqcBsLKvW1W
 ic2ZPr788V+yG1/sX2BgX93dCVdH9wqhKuZtlmnGwJPdoH0XUtldMK+n790Pnn5XyWClfNP6d57
 4Yoxy16hHve47U4eRN31dBkLA+shw0WEwFIUTukeRIx3GLqHCMQQ+4qA2Pb/+7i3j2r2zp99cDx
 8nY4VRSWnMSen3/liIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX6HhuZ5/4CcnB
 tuXzkRwsuOV9bMsqFUQ2x5Btjdng2RiNTyHd1eZaw6oN3n7kA6NYLKWwecZsC3oUSJmOeAoG/ml
 puKDPC4zWXZuwLFbqBfDnvM7chhAohU=
X-Proofpoint-GUID: Twe5sJeK45H1btHwFf6VAghtbMvvwroE
X-Proofpoint-ORIG-GUID: Twe5sJeK45H1btHwFf6VAghtbMvvwroE
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4ba368 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ESSmVKC5p6WdXJfq0SwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f5f805446603315ba76ce1fc501c908f1cec0d16..3cfd2f02b62f3cc370e0d970ec2643b638fd0fec 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -397,7 +397,7 @@ static int tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
-		pdev->dev.of_node = of_node_get(subdev->of_node);
+		platform_device_set_of_node(pdev, subdev->of_node);
 
 		ret = platform_device_add(pdev);
 		if (ret) {

-- 
2.47.3

