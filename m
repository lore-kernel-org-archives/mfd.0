Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989809;
	b=jLktKcORR1h8KuegCsgGRX7XKG8gqObyqzwacTT5mvoUk5+7pTiJ1bEPoYpT1WDIpt18
	 glnl+yMq3sZ2h6NQ5wHUJjhfAzcePgokAT9+x3AJvjonAUCcwA10vulp7F3Y6clQ/0cw/
	 54fTqhVJjsNRiAxbTcAv7gNe5E1aA0U/lD7KIEwkzQdsIc/OMVk+PdFJaWZyJzSSMZIQC
	 pqJhrMgU8dyBHd3BHQc10ki4xX1xHqUGGyC7g6P5R3epLsEujEf+sYbkPDdf7HGJu5gE1
	 /eA8wifAdWcMoh1fm3frRQRtbg9CprDxmz9gFm8W+p7X0DYCKC1NcMqWIlYIQqM/+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
	b=XDSC8hoPJL3G+3TYR+JRtFHlEtkPH4U9qxUKPxZdETxW7v5QlW9E9l6Dv4tNSyY/59rR
	 AKzLlkTSBlh91rZasC2aoIZi+MiV3V1HPBy5FR0YVBf6forz3Ew1QPkbSGMUYFWUvoLCk
	 xzQxsMePzqr9gCaVWxHwd+BbxxgcDKyTI735TT9R8H/i0a+6AgXEHbaLGxHzxnB8D3eG5
	 fOx4edYsE26YlzCKU5Rd61JbMKzttGJNsspSeWaqq0Go28wKTTrM9IZggyoOIyx8Gru+r
	 ZcljNE5ZTPKZ6VpRkfYzXjJ/P1ryO8gd05OpfoK1R+xplvHk3GwdzDeEu103Dv0ebYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fawocRW5;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ACE60A2608
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86ACE60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fawocRW5
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so396598b3a.2
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989809; x=1795594609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
        b=fawocRW5wzdWKgKVD/dpmTTNychhddzao4DwePjMAVZDmVvlQWSd515/fXfVQv3i9M
         6U0M1aPKGsEZ98eRDMlB6OvqILWq4enn1DFCTGVI+Fzb1JmsXgAMgLh+7bncZBPtnRuU
         U0q+z1yv7Ue8P/eiyuoPX7HrPfST0iGwQLhBaL8RfUi7Y8w5D5JezkXPw4LkJJHeCcLX
         C2JQjyoN/c2/UIwvdEoH/rfnAAF7oAzGej6/aCLH9oR5FeiYXepuBp3pvNnKvkn9B/26
         cub9USHoombayNOzb4kAIP8GSpjDGVVcf1oC3YkuC+9hLv+r/5ckjdTne0Izux5NYc1+
         FALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989809; x=1795594609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/X/ib+QXW0aM8E5khBCUAfePu160JSALCSJ/A5VZrw=;
        b=hRup2ozGDTAZzxO5qr1B8Vtfzoe1OycRdEFWZwvbkbHEGOy6aG1VWGadWgfBqAebzG
         1K0bMJkSDInYHbN5QJqvkckrkN1itGdEcHOCTEm46E/iG/ehk4T1mSRUi41J62QkSnMx
         CqVeUrZ7DVnsRSnurV98yGkmoReqKT/4OckYZp04QEWMJo8EmvI4fvp/EpURFht7nVHj
         9LMwnw1Gb0qYIw66SdpoyQdtlhvRF/jpiTxXhOsbR2opgZTNhgWqebjJNrZutxSLDTkN
         r5M690XGjD+RgC29/LSlQ4OxdwAJ9ffI7vX5EHoQ5TohIpnKppIkfW9QKRZU2cCbHH7q
         a/NA==
X-Forwarded-Encrypted: i=1; AL+hErEOZ0TQJhj+7SEo1EKczuLNA/00oKd3qcJA/49N7z634+NQRbFAQL9KVOzPMmjTrDX7A2w=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Z5cr9osdkp9edgEEFGybB7tEyVIOPc0PHBQi/ohVR/dAnxBzO
	i0LUruGjP5HvyTxSH2/EEhs/EmPUIFoa1PBxXDLE69wbXXXT7X3Ce462
X-Gm-Gg: AYBFou0jafa+DLBU02ERYSxGMFNmgB5UOVYbiNKoEpYbDdlY7kT0/t4j9SrW8AMT4y4
	u9dLqOz+RJN/N2cnvoAxARvT0LiK8Udlnk0PJpUXXm+MifFUbJrO+5weRKLTP/QljH1xYJxz1Uu
	Nqf9EcPrTBSwzoha8ma00uk+m6fDA+HVS2LQl/sBbpOkIerZUobsAm/bb9oYm84izF2L6i1ss1U
	WFKblfHiYm3uARFPkHeeaRihY1rQTT+P5F+FzDbYBN+yruh6mXsU4Ip/XoJ91hVfwfG+Zc3UU5z
	cbikD67Ohx1oZ3Qx9Ms4swuMXTzwVf2RKueicUg71VE54ba+Q0oFPNJt6dprphuKkJpIHqHHRm0
	hWUH2kZBp1u8GvdbLf8bJ4YmZwc6xAgEwrs4GqJJaqelnU3Lv2qS2dODk4OcRwFEXUW84O5qy+X
	Zo366PaN6KI8eAOSChDLnE33+zsclLob51WtydbRt9iHN3T4iP+uZq9dfq+sfM6xHTz7gvPM5/M
	WP1D0NcSqIvhRx/YwqHMjgftY2biD/1exeggoC4PlswwQQlz79trJwKMIDZUnJIGDlna4xFsF89
	EbeZ6wljXPUSCUaKoBzQX/Ea0iE9JlbvjGt9oz4KL/GYusyaZ8VOMhTg9u5eNmdBlAhyP7U=
X-Received: by 2002:a05:6a21:7a8b:b0:3de:4516:27c9 with SMTP id adf61e73a8af0-3fe988f72afmr1918544637.64.1794989808851;
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:48 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v10 05/13] mfd: nct6694: Drop the unused IRQ enable mask
Date: Wed, 18 Nov 2026 16:16:16 +0800
Message-Id: <20261118081625.2399247-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The .irq_enable and .irq_disable callbacks only update the irq_enable
bitmask under irq_lock, which is a spinlock_t. Nothing ever reads that
bitmask, so the callbacks do not mask anything. They also take irq_lock
while the IRQ core holds desc->lock, a raw spinlock. On PREEMPT_RT this
is an invalid wait context.

Remove both callbacks, along with irq_enable and irq_lock, and keep
IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core falls back to
lazy disable, and handle_simple_irq() keeps a disabled interrupt pending
instead of calling its handler. The behaviour is therefore unchanged.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- New patch. Drop the .irq_enable/.irq_disable callbacks, which only
  update a bitmask that is never read and take a spinlock_t while the
  IRQ core holds the raw desc->lock (reported by Sashiko on v9 06/12
  and 09/12).

 drivers/mfd/nct6694.c       | 25 -------------------------
 include/linux/mfd/nct6694.h |  2 --
 2 files changed, 27 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 6b8b951f0166..27e9effd68a7 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -19,7 +19,6 @@
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/usb.h>
 
 static const struct mfd_cell nct6694_devs[] = {
@@ -250,31 +249,9 @@ static void usb_int_callback(struct urb *urb)
 		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
-static void nct6694_irq_enable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable |= BIT(hwirq);
-}
-
-static void nct6694_irq_disable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable &= ~BIT(hwirq);
-}
-
 static const struct irq_chip nct6694_irq_chip = {
 	.name = "nct6694-irq",
 	.flags = IRQCHIP_SKIP_SET_WAKE,
-	.irq_enable = nct6694_irq_enable,
-	.irq_disable = nct6694_irq_disable,
 };
 
 static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
@@ -356,8 +333,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	ida_init(&nct6694->canfd_ida);
 	ida_init(&nct6694->wdt_ida);
 
-	spin_lock_init(&nct6694->irq_lock);
-
 	ret = devm_mutex_init(dev, &nct6694->access_lock);
 	if (ret)
 		goto err_ida;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 69e4652cf16c..2022b8fcc096 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -91,13 +91,11 @@ struct nct6694 {
 	struct ida wdt_ida;
 	struct irq_domain *domain;
 	struct mutex access_lock;
-	spinlock_t irq_lock;
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
 	void *data_buf;
 	__le32 *int_buffer;
-	unsigned int irq_enable;
 };
 
 int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-- 
2.34.1

