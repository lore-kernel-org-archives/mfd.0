Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028787;
	b=lDwzPmmVY5TvpsYx/noHmh6VlzZrMH7tfl1Yr5V9bvp4XQRV39YWY0wVSN+7pq16EPzN
	 eSxGoQ6iFZwL9FVLMExE2HmCnfUpeWnsmUN6s/zuxUu/y9lKCbDXuly7rfdK/Hn1mzNjC
	 5YdNSUEK1IuFh8jJ/d36VRCkxbvF4RtJOE0F7UKIalcEndYysriBPBm2HqtgMe0ZTJihF
	 Cti9cuDhH7tjW1w8ex1d4IQP9VS+R697MpnfJvD4v0MypKP5PW/58ule/3NDLobxWvtP7
	 8vIJ1bWw//k/KzzayP0s+SrcNL/TW3qsvn/xMbd5PumDuD+oZPockMgFikETb/z2T/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028787;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XtD3WzeMOo++rFtvQ98lK3NebzzgtJ4cv+Z87PdNz4Y=;
	b=gHncoTxppgsmzOowi/YqcyZL6sg0QmnFn6TNB0Zq/6xIb7VX4QQKKENRngoN205QFiTQ
	 FK6x/FsdGNZk+aXl7mU7h7u6sxBRgbXUCpBCdlWSbCZkGFwKUIJkugBdWx4P/uq25ZHAz
	 E8XmnfUf/aD1H+MeNPQwpKvgmwBekvm3msgzXmHOmQpCSJlomAzGtvEPp48QdgHtt/BaA
	 lAgGUIZlrXEVrR74gk+THRm0ICJAeiH4lDO1Z5vPgEe5HEPzPxw08/8XQ3xnCuDCzKMYW
	 R4SWg3rO7fd0K6EdyU8FFeptoVvheQvxLwLod5JBrrBadqrF43C3Ff4Czv4rnc7Wlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ZEeJsD2Q;
	arc=none smtp.remote-ip=115.124.28.170
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD6606A329
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 15:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAD6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ZEeJsD2Q
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793028776; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XtD3WzeMOo++rFtvQ98lK3NebzzgtJ4cv+Z87PdNz4Y=;
	b=ZEeJsD2QlZBqU5a2mVSsB2xEIJeGYoWKzmlqF6hQmPJ/j3RdbbiqZwpiznt0zGMS8cpa6pEjPhWksR43pTMBATUoqyV8y4CzZEJ5/Xz9/9h8ZG+IuJcVmKMYMupOrXD4oKWIZ0fnQD//rDBXbb3JWtOVRkxfmCIexAEGL20aSbs=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07675043|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0058432-0.00310864-0.991048;FP=3309286822709497011|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034138;MF=liuwb@xiaopeng.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jq7I2mE_1793028774;
Received: from localhost(mailfrom:liuwb@xiaopeng.com fp:SMTPD_---.jq7I2mE_1793028774 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 23:32:55 +0800
From: Weibin Liu <liuwb@xiaopeng.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Weibin Liu <liuwb@xiaopeng.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	mfd@lists.linux.dev,
	Guanglei Zhu <zhugl3@xiaopeng.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/2] mfd: sprd-sc27xx: Pass byte length to spi_read()
Date: Mon, 26 Oct 2026 23:32:52 +0800
Message-ID: <20261026153253.689525-2-liuwb@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026153253.689525-1-liuwb@xiaopeng.com>
References: <20261026153253.689525-1-liuwb@xiaopeng.com>
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

sprd_pmic_spi_read() passes 1 as the transfer length to spi_read(),
but the length parameter is a byte count, and the ADI controller
consumes a u32 register address from the buffer. The ADI driver
ignores the transfer length and always operates on the first u32,
so this happens to work with the 8-byte stack buffer, but the
advertised length does not describe what the controller actually
accesses.

Pass sizeof(u32) so the length matches the bytes touched by the
controller. The companion patch to the ADI driver rejects lengths
that do not exactly match the ADI register access size.

Tested in QEMU (aarch64 virt) together with the companion patch:
the SC27xx driver's register transfers still pass the new length
checks once it advertises the byte length.

Fixes: 25ca4ae43466 ("mfd: Add Spreadtrum SC27xx series PMICs driver")
Cc: stable@vger.kernel.org # 4.15+
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
---
 drivers/mfd/sprd-sc27xx-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index 9a8e6add8fca..8759cee052b0 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -156,7 +156,7 @@ static int sprd_pmic_spi_read(void *context,
 
 	/* Copy address to read from into first element of SPI buffer. */
 	memcpy(rx_buf, reg, sizeof(u32));
-	ret = spi_read(spi, rx_buf, 1);
+	ret = spi_read(spi, rx_buf, sizeof(u32));
 	if (ret < 0)
 		return ret;
 
-- 
2.50.1

