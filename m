Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080992DB7B4
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049423; cv=none; b=rJBnpH3IJjciFVw7ZG2gqWINxO//7EAG3uZESAlifLiarzHrHs388b4y7GpEN1KwPagyPpWi4f/6Az8UgSuhSzB3xQcbkFOQIdRsGTH+ZEvaoOzQNz2r2c+jRkJ4X1Umx3pUgF6umDbv1aj3t39oNSKtwP6Si2yiMzWJLb/LueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049423; c=relaxed/simple;
	bh=/IxZw+rPFwV39zq+p6TpSHd4rD601RR4H9Jp0jIyzsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8sJ4ObaeYziK/9Jpf9E720IV7O2J/cpp/4E6HQpXJ8iYsnK3NSP8/3wDShttRh/uXx9TATBgqEyq2OHdJEpeScCxvS2xg1s9vdXErBpzX21p49xG9EeA4aHQP1OzCR8S3Ku8PL0zt17KKiLqXmfbb5XmPObasLkv/74BFXo9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQRQxA+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Trl+L68J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQRQxA+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Trl+L68J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6uDj975508
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=; b=pQRQxA+/1t/wHLtp
	9bH7qrghD7GWtYyd9/rP0xceQn03HfHHxwiReLYufo6O1c6lp/JoD801sHtZ8N8M
	eCDc9vRoIJCAO8bGYEZLUzaNM8PSbpLYzjgZVomAHZeYv5VMH/Xt1b8WwPasbGDk
	yOWEjTUkG+IJ6+DxBPgjkVAbS0ArwGpcZRwy7+90saDzN6TA9yGHDZ1vfiKzFgu9
	jbiLv8Vw7LwANZ797B899Bh07TFr3HOT1lvxflM9YoNeuYx51zMUuYOeGc+Tv/x5
	Bvqsy2ssn87mR2JOQ6cSXHYvPg47uvT/pP8dSeHR1p+5K2Afo7cZHCbEN9GLPvY2
	iEgeeA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2d12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:16:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so7511735b3a.2
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049419; x=1784654219; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=Trl+L68JEEFFnjPkULTmrvzbbLa0Iy8gPGfRe3xUdRTa5UaZHS7yr7vt3rJVeR0HuJ
         L4Q4iZCFzq4BgLZPo8jNMCi4PZT+bqapxXXUd/fb6VSnUlzJkdsnhomyqh12nWRLjYCJ
         NQnSYegnLulESM4NUqaaDnkHyvTpSx9BJdBKUq/iDGFCu99AWL13Qs4+wYM+q9L9JfPx
         j8gAbAHtdnNkFkKQxpYmdWNAaUhDUP/n8Xb8L0kuyvSxff06eZU6GIKhLNWz+zSHILr0
         ukYuXDF1vrtW8vwIWg3Gi7EPIKlhtsTXUNtpN4BS9A4QBAJm/QF30gEh/dMWqf4wyMJW
         jbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049419; x=1784654219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=eHge1khEb7fthUuDxUgxJBIPumAANNuOWuQk5sQYjYBPMq/ZrgP3W084CplIxO88I0
         SqUS+3OKg9OqD6reOYUWmesDmN8sgsEWSo/mkr4tpK6BYl21GNQVAaqP4cX91uQzLTH6
         zw2AY0V3p5+qNJxuCgRTR8v3jGPMSDrOMDIEaeJu2AMV0GEgh0SYtYwMyTpbNvt09oTA
         D5wiE22g3xJELJNBlKIOHiiFhMquW7qtYOOhdKrcJP/k30o1MRcG7MsFnGsPb9L/jVYW
         uwpQL5ylU1Q26oln3CvsdjUcnZ6GQ2Psx4AstrkFjJJD37fukPfWCFVB/xrS2V3E8k+q
         mRvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/7OlgWBBkD1wJZcrOXAWSIbApLIH5vk9LU77FpGdPH3CRTWCpJP1ojWrHM4c4B/E7we8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlOTpR7NwCevvgbp74wuSaSyr7X2v5A8KUwj7AJTfjdJK2jFMj
	rx9gnBEzgJ0wNyw1dhQ7d8Gsx1Zqf+tSb84XflALUj1PLQTtce2up1qv/Kn3Yn3GMLpgSaOsA/X
	yzkrhxge/+RZY7MegcjEZtAMyoNsvskt2xy8mpqZYmdR+xDGznXgLufU=
X-Gm-Gg: AfdE7ckaTe8luadq/pcAtBqdlRvl9dMWc9ZkyiWzlalItCpInvS6gc/pNvzb4icjApn
	yazT7OLvKsR7E9hiLeftYhQyaDLr10D2Nnjk/7iOD/BSheHbsv9ggKXtjtpWE35648NC5rTI8S9
	RhBgnDKcMWuPxKBwihZssjF0i33mPjUAfhtEEb/3S9MV9vwAD+zXuf9UPhzj9EZk4LsgP2MeKbb
	AKiQngnZ9dBo2AJpgVN1jaOoI57PghMOd9fO6Y1flNPNHdFfXRarbFdEI5xg8ZJtOssoYKt8W4q
	PqRMQqrBdd4Z01d2vxjkZHiNYHVK+bi0z4jcc49WDe1ihF5HFKy7yQYebonmfoM3OsjPjJ+w8D4
	Z0AUJM1Q0VtlvuHuK/SUQvlHsYICK+QHw7AtAF5szx3W8Wa4=
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3518024b3a.57.1784049418886;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3517967b3a.57.1784049418391;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:29 +0530
Subject: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3945;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/IxZw+rPFwV39zq+p6TpSHd4rD601RR4H9Jp0jIyzsk=;
 b=FOkQfPXWoK1qKl0kI0Ie+LmI64jVoDcFZgWGS8EMP1eqQh+aDqSNIUpOAP/s/w438Ry6H1wC6
 tPpdm8vhetwDWabHr8DUbmoiap1etgE61m9idry1GmUboP18+EMoF3E
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfXzQV6pRpgnlLP
 /eyM1ueAxYiJRjumjV6LbAuCPswgiHizVWW19DLHWpVdbKr0hgKebgll04dwChXTCBQBAaJcJHl
 323V5jt080vRWbvb6ZfcMnLDqSgv/V7L7c8hm4NOD2IkzhzdOOSXe94rhFjlTbWmLSUNbgY4OxP
 8D7R+ZmG05HC8kvw5w9OJVxEzdr/XsjBNWpG1OsJ7NSaR9MqzE0VIvGPjc9xFSfWelT5wg0muYS
 cY4L/r6/IoKs1ukG30l7rts1hEv4EgaintMsl5Hyaupj7vmvGjxRwwuIQ1NXthz9+8Zj3HhXA7w
 J1KKS4+vAvuw7WQCjSWgrt/ADKjTrE6PDdCFdsYFfOTrxwsR4kYz1RDpXaeuYa95VKZasFdJUEY
 iD0PKmOIHj0I2e9h+f5E3PpwEOItShlrqU3vS6lLrKxmfctQoeOcgpb5JuPaqn3IrNDzD1hJrua
 p9RsHMlbWSRZksZwpZw==
X-Proofpoint-GUID: -xQHXXqJ5ljfKTYS4BDG-sD64KOmrvW_
X-Proofpoint-ORIG-GUID: -xQHXXqJ5ljfKTYS4BDG-sD64KOmrvW_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX42ZFR1R9sZIi
 IKtEB5tSKhyGzdXR2P31qZpeHqea1Hi9XlZBsVvxPKFzqUIU/QnPQIVEmm73HkEWnkMUxfK/r1G
 wkoIYzTR68bDNHyXWnNtkKIjMeZAxmU=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a566f0b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db0532..7a74f72a8313 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -10,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -200,12 +203,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1

