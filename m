Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612732;
	b=DlrYd+CM3+5YWbRfVtc+0A9+qLEZrk4/+OcjM5j2lLHMTQMhLn/yjzNF6QqsRr9q9l2J
	 d6H7SM167JDeBTA46ARM8XTREV8VU99Q89mxBJOORXL+SvVbNghskcudbkp1OUZVydUCR
	 9K+HE2dA3TMDicqkHYfmijKHrqOTlqpbaBantzNIfGzSDympuxWsBUQmFBESvtxF4hAOS
	 NqYGqmTUZcHp+D9pcrRQDvYZoAYln8HCdrVvHyObY926sj6R3h6gSgWpyXCiL5C7tbS3e
	 Y6YRldLAMYyuKcGJRMaPVf/6Zmtgpt0C12lkh9VMAFZ3NK5ZwNG4X/OdIU+ZkAn1dVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612732;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=ompCW8NdWaUwmG9Gswd1ZB7xQqhdsePpUvFgdcR4PV4=;
	b=cdKQFB93V3ZCx8qPnZaXlZFSc1GjpV+X2BSWs+8FKpNaQJGAZO1JVCab8oC2K6jDbQhc
	 MOv2jTHl+s/pUz68qvF8mWJSRbM9Yf31rH8NbYLxmPGxdJJgxqF3v4ZTedGrkiA74IZNX
	 3XiLcsc8x8asG0/bxZE9ORH0QQFtv3GPzjOKMbHQr9gpQFtAD+3tHDXY3yFGIhs2ogqJM
	 1aDFa6hhkaIDVzjeQ8lo5kgR0HlPxpHwkPynSM2P/jVA+HmoA1qA+AIFN8o9sJyP7xfzr
	 A6TaxWSQyrT+0AeiTrP5x0/K2TMS1Qlh5dD415CZt4DubDPP9rdgQMOKN+vwjvMmi1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=nvZhU41T;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB5606A326
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 13:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=nvZhU41T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ompCW8NdWaUwmG9Gswd1ZB7xQqhdsePpUvFgdcR4PV4=; b=nvZhU41TKtMvPYIVotLWprsdCj
	Dw/PRG6MbdjiTBviitAK4ZqUfEEAa0ic2A2sMDs3uDoWBvecFY6E4DNMx/GGhoY08gL+4k+0GW0hf
	oq76K6DLnzr5tMLR3okvkwmzaWcFbkeQlMHnLcsIeJqIU/MJDFbKkqTbTfBnOCZd5RwZPMvdLbH8g
	8s123KkwIK5XqJg3ciFcE1MZx6cqBmo/nFnstn9M7WLfri/eoESWDhTfSNwgyuu0fSSbmYTXFshjt
	p8iB6VI4ETn6r3MPKEgfv4prZUmwHWEXlyIf9j0Pnp0PLvliaqle+k86KzOnFHLsgCj8tGHMJbPvb
	qIF5YQFQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xWCtc-0009YK-37;
	Wed, 25 Nov 2026 14:18:49 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xWCt2-000M9k-0J;
	Wed, 25 Nov 2026 14:18:48 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	Liam Girdwood <lrg@slimlogic.co.uk>,
	Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	mfd@lists.linux.dev
Subject: [PATCH 1/1] mfd: tps65910: Fix GPIO amount for TPS65910
Date: Wed, 25 Nov 2026 14:18:44 +0100
Message-ID: <20261125131845.4025694-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28194/Wed Nov 25 07:26:59 2026)

TPS65910 only has a single GPIO, see datasheet
https://www.ti.com/lit/ds/symlink/tps65910.pdf?ts=1795584464029
The wrong number was introduced with the support for additional GPIOs on
TPS65911.

Fixes: 11ad14f86a78 ("TPS65911: Add support for added GPIO lines")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 include/linux/mfd/tps65910.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps65910.h
index 3813fc9c2b55e..bcd7e77bf50ca 100644
--- a/include/linux/mfd/tps65910.h
+++ b/include/linux/mfd/tps65910.h
@@ -809,7 +809,7 @@
 #define TPS65910_GPIO_SET				BIT(0)
 
 /* Max number of TPS65910/11 GPIOs */
-#define TPS65910_NUM_GPIO				6
+#define TPS65910_NUM_GPIO				1
 #define TPS65911_NUM_GPIO				9
 #define TPS6591X_MAX_NUM_GPIO				9
 
-- 
2.55.0

