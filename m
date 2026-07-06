Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEBA478E38
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341913; cv=none; b=PwxD1ZM23OuVeH9ay2MzFiXQxu555HMGqJmKniXMIvS5Buz6vZ20YCLmTKBhV4tNy/jdglvUWxjA37bebsCrb8zT9y9t9NDjtRQjez5A0L4vHUEw2c4GjC9mhJO9uZrxUQIKFFmY3Z2tCo5t8Di/dNJqUFrLMd8DRPPg5D9J4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341913; c=relaxed/simple;
	bh=+WcdvgZW/GV7zpd63JB9LAlXwRPQgiphP/JVsTCsf9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUzLoCkVX2IVzcHYOEGizz846JMNk98MFhmCnAxZH85bhd3DuYVBXtirpwX3HXpuJUD2d1sDnWg1IgSq0xtbae7GDCDZfMqNJXG6K3rbR7UFGXQC9shhBcuJfHnm4Sx9OIljxZ5cP0qNEhkkO47MmUKJDNlW8JWC0qWwiJ1glZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndHVMfvR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2ri4Uyn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndHVMfvR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2ri4Uyn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHRq174777
	for <mfd@lists.linux.dev>; Mon, 6 Jul 2026 12:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=; b=ndHVMfvRot9OESgz
	bmqfKntKEZvo//+p8zWxhoH09IW/KzihNN3W4EvwovRAKx1bms+1LnqsTZKGR9ga
	gxIHIN3cx8h4MQdN2yKrLJPsiaPAMpV3XcjA3009zEVj1O80C4Kpxi6Ev6ZAqFgK
	WpWeOc/IDpLzYVoOrnbVqRR3xxFSbp3nnmRUy9QyWMfPm6BSJJHEgTya9+9MQ0kD
	+0B+LXZQB+tvGXWFJ2qkPNHYK9JfPsnp4S7pdz1MD8SoEPz5KthgBBn/wdLOO9iE
	ufwTG6EeAqd0idJEi9ktHB6kUsfjGyJgdXApDL4Uf4fDDYpNgQdN8u0ezx3x0XO6
	d8QALw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs965-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 12:45:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e632390d2so561970785a.3
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341903; x=1783946703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
        b=U2ri4UynLKJ/cw5VLVvg6aFoJ5QZv4CroPlnJxHqCaifSbtXGLrIXfcbLW2B21wQHw
         YitUStW+fIzoeNnXaj/pw/s0h+lTtJ36YNl/NF9MyERiD0I1azUgTdSLcKYcjAwo8u19
         hFiP9t7tL7/zedO9Fks+g6hJFHT6FyFvkd8rdttNZkMylRJCDeSG7NJLcdsfOTxynONn
         BtVgQu4DhjRIBq2FvUN1Yk+CAbipziy3OhZPvUKtCWr7KrozYiWj/CF1kGXdqL0d8/r+
         IG0iAmxX+CzGtdv9vYP6717pFnqxU0qxs5+dI4GiC/xMLIVcNglSTmUONkXORVnQgV+M
         a0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341903; x=1783946703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hgACBdC65jAViSHKJ8hvXSA6344SjOZiB+08kUdch0=;
        b=tOKi3s0zQD7tBITMpaE51fOLPVMz4iR6KCz0d4viVopy6MMvaUh35iUKeJu/mpafh8
         HBuR8Q4j/Novv1lQ/LyP75+me0sVDkNGwMSGuoFWuKe/tUfdaUaj/bpauMpnCW5oXQIX
         7U8AToTJZowOQ5lBOgrJGadh/yGL3abDBoteB96koG62byn9QM48j5dReb1a+i7FZk+Z
         zSX9o2fyb9wXJTgbiT2qfDDeaIP4twoTLDqiUj9L7RVzmWpxogpM4qhmHHxDCtMTfCNJ
         NWAf829ACya8VwGxMiJJCjAXoVe39NnO+MbNs1VBHD8DeEelrR0AFYc4oi0xClp6zbjw
         +SQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5WNzyFEIW3rj7Q6Z2SVBTmL55+SR/SPdAdyGh14hcdl/Pahfx5uy9up+ALopa9N/WwGU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvyCMvVhs5xBXllFjCe66GOkMVLf/24avrQTZrWonh74oIYMNW
	eIL4ZgGTL5YSBnqAddP6Je4E5Ui0MFo5r47UBhxls9E4Fr1faZ2IjpQvYNwlpb0U0nUmjB0IfCa
	nHM1iog4asvfwVRQYJOuoBguVxMUz3dKCikx8id6IK28fiwqciHhJqU0=
X-Gm-Gg: AfdE7ckHU/lax7VU4poRWYbEkEm/GxSunIGZICmo1eztPOZj1brczbPw3NTUWYLYyB+
	dcClffCmZ/L0Em/cSnPGiH49+QT+VrwAJDXufjgwo6DU4lgElCBrbMG1iZm/5tCiIJQJ29IAlZv
	PvenB66U9Zyyldkn9MEUPwsLxIeoF0FToBtf6FKAWpoPbw2cuB5xuFuIOy4JbWi5wAbYFW3NMLy
	GtoaJ8F9oY98mTHDagof20DAAUY3QuuN7CJNhQr6/etvhGjNY9bUSkDvHd/wYkMfEs7i6Rf5EHF
	6IyEs8oeHcNjsU/EtOy6eEsvvG/iGGQjwVPEQxYp/G9TF1/A2bFNrKW9gjyHdwQqrxdXWK8oytG
	xVBqnl+bDSyLjYCv+Kb0TDUoUggyE5EVgMwc6gUmJ
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id af79cd13be357-92ebb5db477mr46122085a.38.1783341902650;
        Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4486:b0:92e:6637:db3 with SMTP id af79cd13be357-92ebb5db477mr46116685a.38.1783341902117;
        Mon, 06 Jul 2026 05:45:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:16 +0200
Subject: [PATCH v3 04/20] driver core: platform: provide
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-4-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2350;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+WcdvgZW/GV7zpd63JB9LAlXwRPQgiphP/JVsTCsf9Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MxkIvUW5KljT6xFge875O9WuwRepvZ/uG/s
 6o6vN4IqrCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMQAKCRAFnS7L/zaE
 wygzD/9GDta/x8WmSP7QOy6l0yvV7/uc7SVNI8SZk0/6EqQYppSZGt+f/ZQn7n2bhy1cxHgZ34s
 3vBKO/fX5ijfkM4Ov3o2x6YGnwXiwoO2TPjfM/6YHBlrfW1y+A8TwoPXIHgyDFPJxJ6PVQ+4gVJ
 /TK9YFAMFJLfxwURMyg2CpxiTR66hwOXPv9nxFXomOFD++/xJHV9pdzxgnfS2IWVtvBgDSWt466
 0bpd7XvxcC6qsIrSuP0H8ZqkCmAY9J+J1XuK93A4UHaQvVF1eC7dwMqhhEHqlpwTymNUbNJQD7/
 bT5qpqvGh8NmBUR9lXPWDtvejPorQDPOhPLJBFNBHCWCSZS29+1Ez5r9ZG5YryWI4cjaq14KBDN
 8k3TbdQDMjMDrsPoQhhTXZQzo6KaLjLdyc8lY+1G523oChbOOF7jgmkhpwdED6yulf0i7zZoSQU
 ygm/QABfr4ibjk8s5uHfaCo5bRazsd138pJesg0BKxivJxckX93Y7Z+fF7sMHKR11BeCpCb4VPy
 FkDkijjNDyiopNnw4UmM1KfleytMiaPMisGpJSoywFh75Z5yMp5kWMt5Odqgne/VT9Dr4rLQi/e
 bFVf8caUa5gPzaoiiuOdbyLor5PcG8kXRX0CzDVWnMKjA7CDypbfEzPWVn7dC+UO5KqKYMZAXiY
 FINuDuEMaN8BS7Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gwYVkT7UEuMVj7HOmzA3rrK_u7jVGBUW
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba34f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=nFtAjRmdzOROD1nQPfEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX824E6ocUlC3i
 3Dk7ymhWmgYO9N2hfoEJ6AEfZ1MwTMGhimhV9OmIOhYGvOxMT9iBEIHj4eMNs7AMd5bitGVAvg8
 RehfjmWEYWwmjBFl31mYAbD64KbV1Dc=
X-Proofpoint-GUID: gwYVkT7UEuMVj7HOmzA3rrK_u7jVGBUW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX5SJWvv0y7aSb
 XXh/t3g83MG1c6pWBdcpIDZNjbJ7g9JY3T8Nge4pyhbnketGmLDUZVNRB7+Y/kZfd0FkiJqQBdt
 iWaj33VcWrl+9hBABSYVvw0Hp6ddFb/+uimkFyiMVXp+hL0+T7c1oQL0QNP4bag8wgzqEl7aajY
 4YelatJ3T5+9Wog4WcK0GVECABJpUb4nM/3X8hqesoEvxfIf2K06IbFjIcCeQg9jusGhRItOoqD
 gyoEKpbbHU+o8pT+cHawHnh/9ZMfwyJOsh+sTHTCtMUgaCwivM2/LanWQBEuQcAea+vSuW9QB9D
 H8J3qErZm3jjI5IT2M0GqVXU67/R/Xu8TPiG//cWH7TESJ0RFQ3QJv+AmxLSubSpxNIKi5ssJ2/
 V+R5MHhouRGqpAcshXIhkUOhqJeGUDISXeIy9msT3lHlK9C/62TTmqhSrs7i8u3a1CTfa2gWxXS
 Fh/uOfNM0vtUmos9AIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Provide a platform-specific variant of device_set_of_node_from_dev(). In
addition to bumping the reference count of the OF node being assigned,
it also assigns the fwnode of the platform device.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 16 ++++++++++++++++
 include/linux/platform_device.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6520b70cf3052d683a2ecb1a0dd7227575546ba0..f24a5f406746b53ca9eaab9472f6dd1345e04ad6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -730,6 +730,22 @@ void platform_device_set_fwnode(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
+/**
+ * platform_device_set_of_node_from_dev - reuse OF node of another device
+ * @pdev: platform device to set the node for
+ * @dev2: device whose OF node to reuse
+ *
+ * Reuses the OF node of another device in this platform device while
+ * internally keeping track of reference counting.
+ */
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2)
+{
+	device_set_of_node_from_dev(&pdev->dev, dev2);
+	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
+}
+EXPORT_SYMBOL_GPL(platform_device_set_of_node_from_dev);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index f037e4101c41dfdbf628d013348d7149ac519721..5333237ec58f30aecb05a3e160c7704fa07a0490 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -269,6 +269,8 @@ void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode);
+void platform_device_set_of_node_from_dev(struct platform_device *pdev,
+					  const struct device *dev2);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

