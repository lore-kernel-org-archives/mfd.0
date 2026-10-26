Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044561;
	b=qiOTzcE9hS47w38cs4HZRpP7DMKO4+1hJKuZ0y+c96RQsnuMvG3yuHPs99H35nFYa/1K
	 u4hDvf1u3YTbaV7zoT57VOJ0EZbAm9SjKKLI3xTGe/Kktb23ywKVRErBP+MtGOeEP65KJ
	 aNnXP9HUl/IkKwzVoyBd4N2b5UTuTxrLBkIbbw+ELJhhiy3x06q5IEgSvS5i5xn7MYr0A
	 ieDgjGKRKiEafPvODIfyJ4j9j7jCbD36XPaPmJ6zXeGyroP6OXIjqk/7j0XahzuOcX+32
	 1x7AVwr4lLBkXmGd+6yrXenJLoT1KluvqrV+WJIFEc2hMjbxsqwNVBrF0QqBH6dO6LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ml/5STqgfByDdSyakunaEpKYT4XFMbTEXpyOPNi3z+8=;
	b=iL7trvJrCuy0/0oL35Wn8JnPwFa37Raz7dSrfvIIe7QR1qZQjXOFJv364cssRkTNT4VU
	 W+5VifiQVBREG0Qwxsp3hP1QHvPKRaVcJ/A2TUDABgVzfslAmCt4luTZpIWhThKOCeObR
	 fgxDgkX5ENAo5mmozTEbSgeyktSGQZGCWV31GhtS8d7qk10qvawwc36QUS1fgmnsce6ES
	 lAD3zTPBY1PhM1jMa9SUxqV3Xps3ZrdPqz06O83cjwN+9OWVLQzz3GBXtgAwTxKZcB311
	 M30XvfkzDc0KBg+DkSPIQfbwD4Q2Arm4Ucp5gYvu2XOWpoZidEHdP/bwywk670pWTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=dcetEKSE;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6557F606A31D
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 19:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6557F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=dcetEKSE
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD4B76G9xz1XM4Tl;
	Mon, 26 Oct 2026 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044555; x=1795636556; bh=ml/5STqgfByDdSyakunaEpKYT4XFMbTEXpy
	OPNi3z+8=; b=dcetEKSEH1YzOUQngtH50D0eASlur8l56gVZnMb/mmDpm/hbOt0
	zl/3d7MQoJSHGzCglm+r8wsWCY1LAuJ+Jc3tz/HqYAP7v7FLbBClqePQxCFknmcC
	BhRjCsFapwUZ/SDscXNCVLYv7J1gzc0nIJtM74ljzqgvwVxlgfMpj5NTqjmm61MQ
	dDz8VNsp64Bb2dgdwIghFiDVGK39byryEmW3NREq64NaSPYKzjzaZoN6NIt8Xg3+
	TcHZ9DAhrz4OcTeW0qovQ0kJCURFMaxYCG/7YevRPOgMhGjot2Sf2Jgch8RDShAe
	CrkKc0N9st9bygZfnWGnAfPgnc/NeSTkGbw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4SzcUizbHTdz; Mon, 26 Oct 2026 19:55:55 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD4B25Gzlz1XM30h;
	Mon, 26 Oct 2026 19:55:54 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Mark Brown <broonie@kernel.org>,
	mfd@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] mfd: twl4030-irq: Fix a lock leak in twl4030_sih_bus_sync_unlock()
Date: Mon, 26 Oct 2026 12:55:46 -0700
Message-ID: <8aec913c6a80c26c4cf5a1ce590f8439c997dafc.1793044546.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If reading the EDR registers fails, twl4030_sih_bus_sync_unlock()
returns without unlocking agent->irq_lock. Fix this by jumping to a new
label in front of the mutex_unlock() call. This bug has been detected by
the Clang thread-safety analyzer.

Fixes: 2f2a7d5ef764 ("mfd: Drop twl4030-irq's edge_work")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/mfd/twl4030-irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 06809f68b007..9ca000c5c779 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -513,7 +513,7 @@ static void twl4030_sih_bus_sync_unlock(struct irq_da=
ta *data)
 		if (status) {
 			pr_err("twl4030: %s, %s --> %d\n", __func__,
 					"read", status);
-			return;
+			goto unlock;
 		}
=20
 		/* Modify only the bits we know must change */
@@ -542,6 +542,7 @@ static void twl4030_sih_bus_sync_unlock(struct irq_da=
ta *data)
 					"write", status);
 	}
=20
+unlock:
 	mutex_unlock(&agent->irq_lock);
 }
=20
