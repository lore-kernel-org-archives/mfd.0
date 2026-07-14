Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7BD3033EC
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049489; cv=none; b=mgLygLMi5cyKoLkO32fGPvwKB9G89C22UfIO2ofE6TveLnlgI4+41PttB6C8/fIOyE0MmQ8ES9ejJ7RKrv2zKtfvSk4MCnbCmX6pVwXkqWHr745IOELWiX7yXGS7Z8Uz/wiTqZStwivmpuI40CtjuQkO7EWALmDooRRyqpQtvSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049489; c=relaxed/simple;
	bh=xpBz08jTmXyusCjePfq1hVafxvJ109djGJUNB0orD+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LquF65ZOhXWEzx15slGkzzArJ4KqPctWaJpY08pHBOtEPeIqC5FL+mB2D3saw5LuC6dH7g0w1Gh773IwgcwcH/EYynBsI8aAB3wVTX/tyDcUJnS0vjDJ6mGg/LASdP+m2ng5xlaEvVgwVsNJMFap3xheN7UIS3b9uIUSmIexn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwdR8/Xz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbKinBTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwdR8/Xz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbKinBTg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6neZ1145930
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=; b=MwdR8/XzC7jmZcmC
	T62ytHmTWUJFu8YBB7JXFSNibli9m1pMFh0YKAV/hkv/PrBhi9ZP9PaGmJe5Oogv
	bqBQuAG0tx5XqSW30+Pjmk+oHl41zBOhxoL5EPH8QF2mhMlM6+qqLT48Ei17fCX+
	I3hmssAVq/R3aqwNx6/Yd5jMCC6tU5ZxHxe3cIcoriAXqtROLSDDS87F2/xZO1GV
	ZaUzc1HWd6blOoEFpCn3M/Jyhe2nrJ8xjYMJaZKPaBd4wf/lgvknGLqLi5yHJDhQ
	gNrwYALaUa6KJVEsvUogQi9DFwMq+PcJq56xIoKwFSLrcBsg00P6yp/crTTfnF9T
	PO+BUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnus393-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84854c2f888so8320587b3a.3
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049487; x=1784654287; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=CbKinBTgh0pOcJfZ7HYRlxro73jj2UPnU8T0Am9byJY4Mo4KE6MD2wm7HlBbi89MHA
         Pe/M7rkap60QCxmIo2RYUobGestBXHOKBYzfLm0TgnGwUMiaW+mQbETByx3JatYioM49
         v4YBjnoWH60jtStgYY9Muh7fq3MD6Bzv7LXkMxEV5armsh1bur5Z4I66u2lQhsJRuQcc
         eoZJGdixX2L0bIGmPMuFb6Rr3VPrfyAeIajW8MqbZpDzctozmvcf3uUqnT9qW7ysdrs7
         byYh/kLwMLjYrPe1G+WDk6URhkxdgO7Hwu1NPL1zeVU5NfLQTX+wSGhvZdI+QaIZopr0
         oCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049487; x=1784654287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8s7l/m7UGxkZIIDkB6Sh24bMViJas+fhJLKeQf2TBPU=;
        b=TzWNCDbKQ6KMuGtrEljJXLhIR/u8Cchcol4gxStwyU0hctl4Ht6Z6ti1U4l6qxUPOJ
         FLOvZ32e7ALnWIzMXvD62/lSzvbIZfw2osX5BTahA5x2I0QQbY1pewAqByp8wMi1OeRG
         II7vbSciDT4XX5OaLYZstWBZSuMGdSZD0ifnroJW+aO7n58zP5tvgw91/Q9UZUmqw2Qe
         k90mNqqnodEjCI8HLgl9kDkwzjzTCH8TuUjZ1xYgRPdcYMvxyWikY8Ui0J5tgitxlmOA
         SJHFEzDMRbOfnLkT/YiFs66e+QXE7cioLowt7oJIg6BjUrVR1v2zWokEb+YfFBsX+aV8
         upnA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxoq8E4T9x20uSuOYm3I9o1EAUpCe1f0rPxXTqRPiHL9T5Xl2asK09QxHFqkZvbLBh2/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyowcpGfQXlYKhCSN0QCSITRyp6edOyGlfzAS1tM+grFswR5xTZ
	+A9SZq6RG458v1HJvXS4JdolsReedoRN9g2jQWJMSbgJSGitCs55VzxWWcne+T30roxdf7RuBrM
	E3+6oJPcjiUFqH4Ww8woRs9fnMBD1pLWjsU+56yAswDoQ/ezGQCfDs+c=
X-Gm-Gg: AfdE7ckTvkRJ9F29QyzhQD/dj06w+lzCClsTryIjMpxVkOTqu8SDiUhQ8Nqu0YVvHcE
	a7kg4P1cqJtwdufcKU0B3dHf8VQhlocJF25Sz8Q2+qFJhJqOPPglLQYvLkCaDmhSD5bi6U30xix
	KUfm4PnSu2XDBlgIVCwJhg2NBmYf2+/a+mmwGxNSNyXmMr3bqnwiViJ/SyXm1AXXBsNu723wk13
	eE19e/g8k4LMpMi828C+42TbufvlSLGmU1cAv6GxH+1jW1gw7+VQvnjdtCaUKUYuG8vC1o3B/2A
	cfXLuJ80tNB4fRY70EszPqszs94slmYUnpAZbsq8EW0v0ibhXWCdSI3UAtrWQaXWPWLapzUUUpp
	cDx4Jrv1FQqL1Pvk9EMXS9tNXfQ+RTyX3HzJr2GdNw+4jy60=
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510271b3a.20.1784049486348;
        Tue, 14 Jul 2026 10:18:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-8488961992emr13510216b3a.20.1784049485746;
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:05 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:36 +0530
Subject: [PATCH v23 08/13] mfd: core: Add firmware-node support to MFD
 cells
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-8-e7453c548c21@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=8008;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=xpBz08jTmXyusCjePfq1hVafxvJ109djGJUNB0orD+8=;
 b=KXZZ51uhN5KQpmxnw/BcJEipsOj+v1rq8O/+vuB7MR4ZBpdH4zXSPh1vcBBbaGBLatOIJ7tI3
 XDEbJayfgkMDK54Wj3oA6XDxJxXNlYM5G3JYYHiV9uKvkyjsv5yH5Ci
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: I49q6d5SoEKsMhQsU3DdQN_2A_YvNVSA
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a566f4f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2Layw8R8_bQqnRkAqW4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX5DMv/VwD0geW
 gu4FIhLhxWT47tFgUk8/QVhVZVMhai1Rtabuo7dcqnf7vwZRfVs87YgDcLlipVtBvOB5QkbHhHC
 +P2logWLhOid7pzyUt+5Jgf4pAZxfFhG9l4BSnq7QtDTM9tCVvn4Pv8sq7e3AhoqiaNBPGlYkI7
 nXpJfpoURh3AoeRx/QpBZR4GzIQXVeMhJbcCeTQAfTK+RUPa+plgsWiWAa2MLaUsUML+v6mm4Ps
 JWz9E6nJA3m7sO5trnJoAqpWWzUj1K8XRFoRwzshTGsdttrt7RrJszMWnlbW6eWFpH7ySZrfhfk
 /7UuUSKRIweyBd8Gdn9QmP1adwXpooLgFxCg7aIjORQ46nFW5tMK60EAT4NpdHjZ6odueCVo6cu
 pO9NspJoh/dTvmn8IBuLLcHxNHKMLacvbxblI6noGw4+AJxemOk1W9wZexSzZKIdsccnIGgoufF
 xmD3IoyAvlfdweH6X3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX6sqk0f/IqVoZ
 4JE+Q1+Sk9SPaaVfGdFdan335OKOWkVpNdqWZPOOSNBjwiOOSQ9toV+utrYYxTJ2ayFIZ1n5PCi
 PNCqBUw3+Uy7fFwpyw+GNuz4Ucn9Yl0=
X-Proofpoint-GUID: I49q6d5SoEKsMhQsU3DdQN_2A_YvNVSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

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
 drivers/mfd/mfd-core.c   | 142 ++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mfd/core.h |  10 ++++
 2 files changed, 131 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7aa32b90cf1e..ba9682ead2ca 100644
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
@@ -134,18 +209,7 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 		/* No match */
 		return -EAGAIN;
 
-allocate_of_node:
-	of_entry = kzalloc(sizeof(*of_entry), GFP_KERNEL);
-	if (!of_entry)
-		return -ENOMEM;
-
-	of_entry->dev = &pdev->dev;
-	of_entry->np = of_node_get(np);
-	scoped_guard(mutex, &mfd_of_node_mutex)
-		list_add_tail(&of_entry->list, &mfd_of_node_list);
-
-	device_set_node(&pdev->dev, of_fwnode_handle(np));
-	return 0;
+	return mfd_claim_of_node_to_dev(pdev, np);
 }
 
 static int mfd_add_device(struct device *parent, int id,
@@ -156,6 +220,7 @@ static int mfd_add_device(struct device *parent, int id,
 	struct resource *res;
 	struct platform_device *pdev;
 	struct mfd_of_node_entry *of_entry, *tmp;
+	struct fwnode_handle *fwnode;
 	bool disabled = false;
 	int ret = -ENOMEM;
 	int platform_id;
@@ -224,6 +289,37 @@ static int mfd_add_device(struct device *parent, int id,
 
 	mfd_acpi_add_device(cell, pdev);
 
+	/* named_fwnode is a fallback only when no OF/ACPI match and no swnode */
+	if (!pdev->dev.fwnode && !cell->swnode && cell->named_fwnode) {
+		struct device_node *named_np;
+
+		fwnode = device_get_named_child_node(parent, cell->named_fwnode);
+		if (!fwnode) {
+			ret = -ENODEV;
+			goto fail_alias;
+		}
+
+		named_np = to_of_node(fwnode);
+		if (named_np) {
+			ret = mfd_claim_of_node_to_dev(pdev, named_np);
+			fwnode_handle_put(fwnode);
+			if (ret == -EAGAIN)
+				ret = -EBUSY;
+			if (ret)
+				goto fail_alias;
+		} else {
+			ret = mfd_claim_named_fwnode(pdev, fwnode);
+			if (ret) {
+				fwnode_handle_put(fwnode);
+				if (ret == -EAGAIN)
+					ret = -EBUSY;
+				goto fail_alias;
+			}
+			device_set_node(&pdev->dev, fwnode);
+			fwnode_handle_put(fwnode);
+		}
+	}
+
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
 					cell->platform_data, cell->pdata_size);
@@ -295,6 +391,7 @@ static int mfd_add_device(struct device *parent, int id,
 	if (cell->swnode)
 		device_remove_software_node(&pdev->dev);
 fail_of_entry:
+	mfd_release_named_fwnode(pdev);
 	scoped_guard(mutex, &mfd_of_node_mutex) {
 		list_for_each_entry_safe(of_entry, tmp, &mfd_of_node_list, list)
 			if (of_entry->dev == &pdev->dev) {
@@ -382,7 +479,10 @@ static int mfd_remove_devices_fn(struct device *dev, void *data)
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

