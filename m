Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1C38DC6F
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750362; cv=none; b=EPmR4HYpxQaEaBshhjnmCPzPFvvdrywaUlMoojSAtzZcjNW0VhuuMIoNN52/VHKipIgxW1Fu5aheYGeK7xnBoG2UTEk4tHsGMfL3zpvJ5y0xN+gEDGVSMQz/s719oYZRLgqem8zjCp1rGR2om73OsPJJMC1QAMWBZCvzFnks4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750362; c=relaxed/simple;
	bh=YF09NFBv8XV2mwwiWYdQirwqkhH8XmGEPACV2jstcps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PC/AQabFc/l089cYqDezqU7AMGq/PiMCHqJhW0dQ+RfySbSpUDtV1dCvn/O9kc6obQy9JOoPEwJJJdDge+xG8mrlUfZZFqRzSYLrhuRxUtukldNfN9MBo5PyUaAwVnNRCcgcCfZIOGK6XNedD18qzJwsdslmuybB1DDRZ4O0K4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgzCke40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxG7aY+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgzCke40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxG7aY+e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736DaXW3882594
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=; b=fgzCke40gnRS4arn
	f9EwwqN6SB3k1PoNe0aMjz9vMUA0BE24rlR6kj6GGgmT2Wpf8Cyz4zz1fWdxXsML
	zPolrcIt3Y2deLVuUlcokcNJDMN24RmuVBSh+UnWXQH2KbNw6+YQ542FcJNDdXP8
	odgTF2e5YSA/5jo2KCZTIIQEyXo14eJG65UbRE1uIhNfwULznEpv88JBwCo5W+2C
	i2M+0ELnZ8yLr4dGDL6Ke2wI0JSiD7JwV/O35FPPxJtx5mO1boNy5bwi31jqCLG5
	UK9lVtVcSJizltAXIpGCbNoFF25agggUKY4NB/Mk0r3Nuu39FQscxEqY5/M4lS9h
	9MJGKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgwg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:45:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso4377453a91.3
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750355; x=1786355155; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=XxG7aY+el04fHEKg63qGAsFnB+4gg7LFfCMSL8axoAkRVtP+OrFkWyAKfn5KjLqFf6
         EDWhPKi6ERdaQYx304xXlkrLvf54QDsbA3Hhi8wRYjEV6RZIXstTUdT1qizEiaukGSlv
         myADZAz8lax0fbYHFco6iVZ3vW2pyNuaumOeaK+WY0JHVGL+CFkEGX7tu3fznxToN7na
         ByfWRBtXNNQsiE0LdE5yh6izwhk5vi38mdYHSnrx5VUhs+gvGXqpUegFE+YOLiMChS49
         QV8qlEnSpi8E1SCQciXckvRJZTxZ1Wmc7asyfiWzTyaikE5J0ERZqn96+hXalE9lpak6
         Qutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750355; x=1786355155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMf292AZeOlCNbfbdHJJYz8+230HZxidGqGvw+WCW6M=;
        b=qb6ZtxVebTv4fNKMUL+gjYkCUKDAbE7eO7MNr4uHBHgO0hxnkOLlGbTcKE1OqyvHqV
         nG101s82M2uyz3+8nDseQHAUgDIivia3cH255VK6PaIf+Ef35js2+S6KzrEKh787DoZX
         ZjiKUnUfVgnLm2vn11T9Aj8BfSBfeN6MUhmbtmAVccCII+hkwUCmOi2kLtPNPngYTg1t
         zSKwd4ao0022rcnoUqSoDqTpbm4fKJ6Ll9beKtXGuWYBdD54ZZ/Oyg0e65VipIfpp3WB
         /IfdcZXx/7fxcoqzbNrCefu0NN6JF0m3OU6UrnJ80prLoy9K81771UX1wYzHiBSIP7QA
         Vpsg==
X-Forwarded-Encrypted: i=1; AHgh+RoGX3sHkDW7o2ot6INI2/JYjt+IlRN6rJ/D5oQHZYSIGx0ifzt5uAKcrfIYgOOZDz9cEVA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1iBtzDkW+pri5IBDLse9XOgugvR4v5Xfm3etg9FC3ldq2kCET
	sw0x18fO5CRvZuVjK9VUxJEgOJ1i36Q9mUUJRkBfgMgjm8SdLOybkaToAnjau/g6UHRH8n70DWn
	FH1I05tNSDsy8XiqV1JQD2Z1lXg0wbjxLm5qSabRS0e76IA19IDCkwQg=
X-Gm-Gg: AR+sD10cP5rA5i5bRqMghBT0aSwtPWzNi3BjbuLVnRNzh+HQF2PwLcmdU3dnpU+NQlM
	xjfC+338lInSoIDVkq54ItgRvaecrJp6CEHqUVLmaH8d5fSHYdoiqAU1eWLOZXlaHggTbIl5n0O
	4flYtW+ru9DqeFMqRrZZGsJJDl74UZXq/GSDbfkN2xD5t88iPHdmR4YygLm/8mJcr23mv3g3rL4
	zJ42LXqv/U5+DBHBngnF8aV/V+KKulYrqXdqiYmuKWzmzMbedPwB/hjwVZ+4UsSHxIQb4KJw0fb
	TsvD8s4DC7e+zmU5yD7h84+s7t9G5eG024gY/SpyyUgkxC0wajV+F3VQmdLV0arGYzUOWDA6H2n
	Bqe7QVFhKwDlgPwDo5Sne3eTmHOI6u56VfZjR
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726885a91.11.1785750355013;
        Mon, 03 Aug 2026 02:45:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7726841a91.11.1785750354407;
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:45:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:38 +0530
Subject: [PATCH v24 07/12] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-7-889281373870@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=7933;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=YF09NFBv8XV2mwwiWYdQirwqkhH8XmGEPACV2jstcps=;
 b=iWxDeilK2zVkbE2E9xjCYxx29tooW1BOq49KVaULUzqDdvX/jStMSvMhIwd2nOaQew8OoeMcI
 lKpd/Cq9ECPCTsZ1UmShciKwCIG6nToGM9niWP3D+6sLmE/kCk2I2ku
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: wJbzylfDLVCJTukhCQru9ieyFCzFcQix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX8bb2Z8ppSiXo
 lzdSbQiTFye3nV4h2mhQxhWwL4ebcaql8IlzbXV1fVUvA7ibH6+P2hHYpXp3kD3EbqZWmsxZfbV
 nlpkSgMh5Tb7jQwZWfI+M/yYm6QfxeEsri1PEgX1kexLK5ZMbUEsivzN3LWy/wTVsrtamqMM+/4
 zfcWAZvzVjBHLDg7WN0wBx96vWJ8rYLDNrRc7XVUXrVt97PgWjBrecUk/mnCUEJ7YlWU2z2Kn2G
 cydx/wLY6hRRxWeHFWua1ZppyqdGJJ8lFQJl03+0d0FzkE2y/v5CvzU8EEptIiUAX+Onlgt7qbL
 HEyx3aD8VKsLgkyJ6DKZPkNf1VH6odOp+JneZ6WsxqVwvZ6yv+O0X8spP/F8Y7RW7hK92zwUaY9
 gMMoiABrtKhCrMOHkb7RJHamndonQMBaxRKZowai9Cf1CP19G7hXEt9TDUV8y2DigOLW5QGA0s8
 jgqDDIXq7YiwWfSbjXw==
X-Proofpoint-ORIG-GUID: wJbzylfDLVCJTukhCQru9ieyFCzFcQix
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfXwFeWAJugNmU0
 1IMYIqld7AI/5dB0MNA6y6KzDnK7f7zQ85J+7PbUr2Q/MR9yDqk5fSAbIejxXmX7w6r1rLeJ8GE
 R+BnpPGZ53w8iLSnaB+CcYzThEiXoHY=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a706354 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030086

MFD core has no way to register a child device using an explicit firmware
node. This prevents drivers from registering child nodes when those nodes
do not define a compatible string. One such example is the PSCI
"reboot-mode" node, which omits a compatible string as it describes
boot-states provided by the underlying firmware.

Extend struct mfd_cell with a named firmware-node field to identify a
child node under the MFD parent. The node is added to the MFD child
device during registration when none is assigned by device tree, ACPI,
or software matching.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/mfd/mfd-core.c   | 151 +++++++++++++++++++++++++++++++++++++++++------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 142 insertions(+), 19 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..79b400535138 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/property.h>
 #include <linux/mfd/core.h>
@@ -22,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 
 static LIST_HEAD(mfd_of_node_list);
+static LIST_HEAD(mfd_named_fwnode_list);
 static DEFINE_MUTEX(mfd_of_node_mutex);
 
 struct mfd_of_node_entry {
@@ -30,10 +32,91 @@ struct mfd_of_node_entry {
 	struct device_node *np;
 };
 
+struct mfd_named_fwnode_entry {
+	struct list_head list;
+	struct device *dev;
+	struct fwnode_handle *fwnode;
+};
+
 static const struct device_type mfd_dev_type = {
 	.name	= "mfd_device",
 };
 
+static int mfd_claim_named_fwnode(struct platform_device *pdev,
+				  struct fwnode_handle *fwnode)
+{
+	struct mfd_named_fwnode_entry *entry, *iter;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->dev = &pdev->dev;
+	entry->fwnode = fwnode_handle_get(fwnode);
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_named_fwnode_list, list)
+			if (iter->fwnode == fwnode) {
+				fwnode_handle_put(entry->fwnode);
+				kfree(entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&entry->list, &mfd_named_fwnode_list);
+	}
+
+	return 0;
+}
+
+/*
+ * Temporary MFD-local cleanup for named non-OF child fwnodes.
+ * Remove/rework this when platform core starts owning and dropping
+ * dev->fwnode references for these devices.
+ */
+static void mfd_release_named_fwnode(struct platform_device *pdev)
+{
+	struct mfd_named_fwnode_entry *entry, *tmp;
+
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry_safe(entry, tmp, &mfd_named_fwnode_list, list)
+			if (entry->dev == &pdev->dev) {
+				if (dev_fwnode(&pdev->dev) == entry->fwnode)
+					device_set_node(&pdev->dev, NULL);
+				fwnode_handle_put(entry->fwnode);
+				list_del(&entry->list);
+				kfree(entry);
+			}
+	}
+}
+
+static int mfd_claim_of_node_to_dev(struct platform_device *pdev,
+				    struct device_node *np)
+{
+	struct mfd_of_node_entry *of_entry, *iter;
+
+	of_entry = kzalloc_obj(*of_entry, GFP_KERNEL);
+	if (!of_entry)
+		return -ENOMEM;
+
+	of_entry->dev = &pdev->dev;
+	of_entry->np = of_node_get(np);
+
+	/* Skip if OF node has previously been allocated to a device */
+	scoped_guard(mutex, &mfd_of_node_mutex) {
+		list_for_each_entry(iter, &mfd_of_node_list, list)
+			if (iter->np == np) {
+				of_node_put(of_entry->np);
+				kfree(of_entry);
+				return -EAGAIN;
+			}
+
+		list_add_tail(&of_entry->list, &mfd_of_node_list);
+	}
+
+	device_set_node(&pdev->dev, of_fwnode_handle(np));
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_ACPI)
 struct match_ids_walk_data {
 	struct acpi_device_id *ids;
@@ -111,19 +194,11 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 				    struct device_node *np,
 				    const struct mfd_cell *cell)
 {
-	struct mfd_of_node_entry *of_entry;
 	u64 of_node_addr;
 
-	/* Skip if OF node has previously been allocated to a device */
-	scoped_guard(mutex, &mfd_of_node_mutex) {
-		list_for_each_entry(of_entry, &mfd_of_node_list, list)
-			if (of_entry->np == np)
-				return -EAGAIN;
-	}
-
 	if (!cell->use_of_reg)
 		/* No of_reg defined - allocate first free compatible match */
-		goto allocate_of_node;
+		return mfd_claim_of_node_to_dev(pdev, np);
 
 	/* We only care about each node's first defined address */
 	if (of_property_read_reg(np, 0, &of_node_addr, NULL))
@@ -134,18 +209,48 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
+	return mfd_claim_of_node_to_dev(pdev, np);
+}
 
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
+static int mfd_attach_named_fwnode(struct device *parent,
+				   struct platform_device *pdev,
+				   const struct mfd_cell *cell)
+{
+	struct fwnode_handle *fwnode;
+	struct device_node *named_np;
+	int ret = 0;
 
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (dev_fwnode(&pdev->dev) || cell->swnode || !cell->named_fwnode)
+		return 0;
+
+	fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+	if (!fwnode)
+		return 0;
+
+	if (!fwnode_device_is_available(fwnode))
+		goto out_put;
+
+	named_np = to_of_node(fwnode);
+	if (named_np)
+		ret = mfd_claim_of_node_to_dev(pdev, named_np);
+	else
+		ret = mfd_claim_named_fwnode(pdev, fwnode);
+
+	if (ret == -EAGAIN) {
+		ret = 0;
+		goto out_put;
+	}
+
+	if (ret)
+		goto out_put;
+
+	if (!named_np)
+		device_set_node(&pdev->dev, fwnode);
+
+out_put:
+	fwnode_handle_put(fwnode);
+	return ret;
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -224,6 +329,10 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	ret = mfd_attach_named_fwnode(parent, pdev, cell);
+	if (ret)
+		goto fail_alias;
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +404,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +492,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
 	regulator_bulk_unregister_supply_alias(dev, cell->parent_supplies,
 					       cell->num_parent_supplies);
 
+	get_device(&pdev->dev);
 	platform_device_unregister(pdev);
+	mfd_release_named_fwnode(pdev);
+	put_device(&pdev->dev);
 	return 0;
 }
 
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index faeea7abd688..8daa83dd31ea 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -80,6 +80,16 @@ struct mfd_cell {
 
 	/* Software node for the device. */
 	const struct software_node *swnode;
+	/*
+	 * Name of a child firmware node under the MFD parent device.
+	 *
+	 * Used only as a fallback when no firmware node is assigned to MFD
+	 * child and no software node is provided.
+	 *
+	 * For Device Tree parents, lookup is by base node name only
+	 * (the part before '@'). Unit-addresses are not matched.
+	 */
+	const char *named_fwnode;
 
 	/*
 	 * Device Tree compatible string

-- 
2.34.1

