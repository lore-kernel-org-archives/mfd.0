Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896070;
	b=sQGapmfphknEqtxQWLcSsiXLK9TnHSm5W31ueYvUsK/Ibv1+BGAoKoWPtSMicKl1RRs1
	 1ncaTjHR89QI+4l2dBiLShWr2ulS+qP2MXTX7AV9Qh/is+9OQQynphrwhmtwjVOulRRT1
	 3syesAOSFANZ1f1paGMJ53GgiOSyijZLxdq6apXi+ptWTzH+RDOqI0uDSZT+76/ybEXpv
	 /frSPofKliHRkFAZDBSL1vEMEyA+XRWZ3FCzX0xsDTcFIVqs/OoSylyO8pnwMO8ltrwnZ
	 6pN1S8mZB/bcOw1bwsAptqoF6rYqZSYewdWbP5tfNapQU2vLAOqjf0U2qmRGLdXb5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
	b=TsX4YvRO1fc6NBdeDjAYzeiP1ou67mE0ca97QqfY03M8Bg74zb1OasCrTLSlyhbiDtfu
	 1nNo71TMq+xx1TbZgvrmLaXeN9+LCvt74E0KdHtw3EMXI1+AEKlZeaBwAaYLPjMfBx3Uv
	 LA3UX2ZcLsxA473OkScn+7LTc/6t75vBWdIu/khcdovqPxlgEYr5ueLZ6O8C9pU+zLU1R
	 ThKm4+6zc3boZWpg+Qy3iO12fKS+ux5H0NwDSfemeKcalD+wrxh7+8AGNVN+FtnmW0VAV
	 bL4z2p2GDOy2aiIMX9ZPja8qugl6M0t3OGzLCoy9mnkOIdBXpNO6G1PIHMmx2tBVBzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXayIAXI;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B1606A328
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 16:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198B1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXayIAXI
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1f1a7695so6201495ad.2
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 08:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896069; x=1794500869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
        b=qXayIAXIyTlDykBFvU9GDZJ2BNrzO93YhxUhWi1kbvsX3NKT48nvunZ89JHRGJMAqR
         aP/WmjvWF42oJDVkEQ68EucoTlHDcQRgBNCY156VyKY6aKgzoDmH4nA8Kq6gSGBTtuVk
         DyCKarfAoVdVe4tZevlogrPCKNjyzwV4vBUxYQXGfbWslNFlvsBTXD6/jelPay4dqlpt
         G1MAZyleIqzI7Ghwg2aK7ZSjmTYCPN7hxSas0PFUVTWDsI2gmRoGMrLukd0MCVusx3Ta
         xJqk5dGc7dRgWJK7W2lAvb7Arocae7n/ZSM/cOO06Vnf+OLGT+QXHGutLPOVEIgg9QZc
         3Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896069; x=1794500869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU+RiqQFh2f5Ka89JSx/cG6xgtNv7ffTWhetPZC5TwM=;
        b=q/buwc9VnKBwtD1F+tOTdyEvePc/aSnn3CE3PMl5d3ZLF0xJbosagPNhycYNfc/O6m
         GOreyQMCdzdeqsPltak7k4HI8kdzPBXPYpCvfCZd5M3aHdD/L/n7DR/NxO9h9qrlbtiM
         zr7dbLHyGerfWvO47hKVzSJjl+H7EwHazrtHeSd1f53s52YK3tOaVL7nTBLoC/HOwWI8
         KPAlk0hYn/Xoq3i0k/mgZTPsdu3FUp3Y47t54pFtoCua4F9p6c/Utlhlb04Q9N+DFziO
         qqQ/iEh28xsPcr1+R/QpHy2NtAuJAxg+tLCdFAA3nHWFVTzjFHqayVu7EIvtpXhmu8/f
         FitA==
X-Gm-Message-State: APuU4Z9W49LKBX+b9BBktHPaoJm9FhkCzpiSshehXt9uchgVOROd23tR
	V3uItQfTxZRfUSpBYIH628ERmaP0l58IBETZ8TNLwoBBg15c2WniVKw7
X-Gm-Gg: AYBFou319YOK7/DHhuwYXJbpZILbcILTu1nDQ+5dmyM4oSyoejqPjFIqnKyel/qf2oL
	yAqiyywD+OU2CaOUi+a9wjoISjXIElHkDGpNcgb+7f6Puq3Ytv9zcsGl4/nUIMYsF/wqTke3EOu
	ytETFR2jyhHTZof6nQZ2lTvdaE6Z8GXaXnHNYBZ23cjvLA/fvOvdF6wk8anpvoiRBJHFTrgRl3b
	FqXYYoXvPjFA5K6AhRt8nOWYwCa2aV5EnK1YDxFdYRmt2zKqff7Hmruw2sFs3sZkQIsonk2ZICJ
	B1GN24xEpbo5R9EBkqOcBUYNFDC7ewOCwtMKBDxCTOyEIeEs7dYN5usWHrTZIOu4/oqhiMqxkxT
	ISti4N3cLEGS6CH4T8yyW7kKQo4JzrknyqmmHAMsXfVWKjR5LTkGkIvEbZiluX3z6Ajf85uBXTj
	ff0q8pE3JgUn+OKOkq3+1OALH6B3qXgWXBsfBVM4ZTtdUZ1sbtC2n+CdrFtMAvp4813JXtpK2tp
	epL0CQ2B82PZ1TZsDa0ZFv30+jhMAtCTpqE3kIOtWRPMMytftH87/UDPZjL5QZaMGYL+AqQ1VbZ
	tjjuouGnonY9nr9KAfSFaAXpVHPQVO7Ik0kJxBzBquUy/fh34g==
X-Received: by 2002:a17:903:1af0:b0:2e9:52dc:4c10 with SMTP id d9443c01a7336-2ed40989b5cmr1416925ad.18.1793896069261;
        Thu, 05 Nov 2026 08:27:49 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe463fsm19859075ad.24.2026.11.05.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:48 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] mfd: si476x-i2c: cancel RDS drainer work before freeing RDS FIFO
Date: Fri,  6 Nov 2026 01:27:22 +0900
Message-ID: <20261105162722.1688960-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

The RDS FIFO drainer work (core->rds_fifo_drainer) is scheduled from the
interrupt dispatcher si476x_core_get_and_signal_status() whenever an
SI476X_FM_RDS_INT interrupt is seen:

	if (status & SI476X_FM_RDS_INT)
		si476x_core_start_rds_drainer_once(core);

si476x_core_start_rds_drainer_once() runs the work on the shared system
workqueue via schedule_work(&core->rds_fifo_drainer). The work handler
si476x_core_drain_rds_fifo() dereferences @core and reads from
core->rds_fifo.

si476x_core_remove() does not cancel this work. It disables the interrupt
(or, in polling mode, cancels only the sibling core->status_monitor
delayed work) and then frees the RDS FIFO:

	if (client->irq)
		disable_irq(client->irq);
	else
		cancel_delayed_work_sync(&core->status_monitor);

	kfifo_free(&core->rds_fifo);

disable_irq() waits for the interrupt handler to finish but does not flush
or cancel work that the handler has already queued. A drainer work item
that was scheduled just before (or is still running at) remove time can
therefore run after kfifo_free() and after the devm-allocated @core itself
is freed, dereferencing freed memory and operating on a freed kfifo
(use-after-free). The sibling status_monitor work is drained on teardown
but this one is not.

Drain the RDS drainer work before freeing the FIFO (and before the
devm-managed @core is released) to close the window.

Found by code review; not runtime-reproduced (requires si476x AM/FM radio
hardware and an RDS interrupt racing device removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/mfd/si476x-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 0000000..1111111 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -831,6 +831,8 @@ static void si476x_core_remove(struct i2c_client *client)
 	if (client->irq)
 		disable_irq(client->irq);
 	else
 		cancel_delayed_work_sync(&core->status_monitor);

+	cancel_work_sync(&core->rds_fifo_drainer);
+
 	kfifo_free(&core->rds_fifo);
 }

