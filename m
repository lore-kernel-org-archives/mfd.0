Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039685;
	b=jvs1fizF2Q9KQgaQ3bGiwSgDfYkdps6Hp1oxL2nnXZvXxAG9F3hdt+NZMB2PzUoNYWDx
	 amrTRxQwH8jsFOZRpTLr4Rjk1dFAZjIHJeZR58Mqom2BR1QdcqbXDgHSRX8CF9Lzyg8q5
	 Jh0W8LbBeezhTM5UjPiNVqGos/tCY8fy50povLx9QEDR+ktjIrpKmbR9u7yfS9VAqYAG4
	 qc5W7J4kCfySy6CEHUGUh5qZbIfwAjhAQoaocEpsU68AZHrqCkzFCijdK2MagcdMfMVTw
	 kDeJN5h1LWz3fX48auOuH12rCUOo45v5Yna0qaTH07ZVxImyaqmJ+05m3O+AcBTZP+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039685;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:
	 X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:
	 X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=rPXEM1BJ3DOPSW4Bc6p4otoxErTXXc3mU5gGibGHZOE=;
	b=4nnVjOXNb2wbR/2EtcZpn8vcVfbL+vRQq7GBfFytSm7vaQG8YUe6EAfegRORF8Fw2YUs
	 WE95dwF7zEYvZX1qFzZSbpM2dUEa0Tcn2RHduYm3wSHJN/J9MJOQTi5psON/rTBW9g0LW
	 YvQ9IKyM2h/UVdtotgNKyOo25Nv0uJ2YfeqGYdnAP/0Lj6uQy3be3fEuq+XF9ZaM+5OHd
	 8cnWm7kpK78tbdMJopxBxAfdt+m1u8lj+0yrQxhXXr/XqNCy+9d9dGWP6qbO6SbGSyIL0
	 m7gwepl4DzIB49iPL+MVzpTIDupfce84HQ2t916tp6BCIrhIpNDkUROPzgsx4uFw+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A251B606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A251B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM8C66Hzjz5B137;
	Sat, 07 Nov 2026 16:21:22 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A78LDmt029722;
	Sat, 7 Nov 2026 16:21:14 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:21:14 +0800 (CST)
X-Zmail-TransId: 2af96aeedf7a22a-90dca
X-Mailer: Zmail v1.0
Message-ID: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
Date: Sat, 7 Nov 2026 16:21:14 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <tharvey@gateworks.com>,
        <support.opensource@diasemi.com>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAwLzVdIG1mZDogRml4IGFuIG91dC1vZi1ib3VuZHMgSVJRIG1hcCBhbmQgZXJyb3ItcGF0aCBidWdz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78LDmt029722
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:21:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDF82.001/4jM8C66Hzjz5B137

Five independent fixes in the MFD core address an out-of-bounds IRQ-map
lookup, an uninitialized interrupt-mask write, an IRQ leak on a failed
probe, a missing IRQ-wake teardown on removal, and two unchecked
firmware CRC reads.  Each patch touches a different driver; they are
grouped only because they go through the same MFD tree.  Every patch is
independent and can be applied and reviewed on its own, and taking a
subset is fine.

The series is ordered by severity:

  1/5 mfd: tps65219: Fix out-of-bounds access in tps65214 IRQ map
  2/5 mfd: twl6030-irq: Don't write garbage to interrupt mask on read failure
  3/5 mfd: arizona: Free info IRQs on probe failure
  4/5 mfd: da9052: Disable IRQ wake on device removal
  5/5 mfd: gateworks-gsc: Check firmware CRC reads for errors

1/5 adds the missing reserved-bit placeholder so that a power-button
interrupt no longer indexes past tps65214_sub_irq_offsets[].  2/5
returns the I2C read error instead of writing uninitialized stack data
to the PMIC interrupt mask.  3/5 frees the three informational IRQs
before arizona_irq_exit() tears down their domain.  4/5 tracks whether
enable_irq_wake() succeeded and disables it on the probe failure and
removal paths.  5/5 checks the two GSC_FW_CRC reads and fails the probe
instead of printing a stale CRC.

No dependencies; all five apply directly on next-20261030.

This is a resend: the copies of 1/5 and 2/5 that reached the list lost
their final empty context line in transit, so they do not apply with
git am.  The patches are unchanged; the git signature trailer is kept
so the line survives.

Shao Mingyin (5):
  mfd: tps65219: Fix out-of-bounds access in tps65214 IRQ map
  mfd: twl6030-irq: Don't write garbage to interrupt mask on read failure
  mfd: arizona: Free info IRQs on probe failure
  mfd: da9052: Disable IRQ wake on device removal
  mfd: gateworks-gsc: Check firmware CRC reads for errors

 drivers/mfd/arizona-core.c        |  3 +++
 drivers/mfd/da9052-irq.c          | 11 ++++++++++-
 drivers/mfd/gateworks-gsc.c       |  6 ++++--
 drivers/mfd/tps65219.c            |  1 +
 drivers/mfd/twl6030-irq.c         | 10 ++++++----
 include/linux/mfd/da9052/da9052.h |  2 ++
 6 files changed, 26 insertions(+), 7 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
