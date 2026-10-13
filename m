Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D4E4B8296
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873227; cv=none; b=ikG35VA1U6VbnbSOeWo17CCNOUwZhLzO5zJIS/+TnT9sNy+hALEk1EigG44g506HhWLHJ4OovMzqFS3mh6ygvdkLody4j9QICVtIVrWa6veHDMuBRoncQc5O8ql9orYxM6vHajmLTxooBjohEFPSA6vY9CCFQB9yrbxnlXo/tRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873227; c=relaxed/simple;
	bh=x+7CuwaNJILws8IjITtVCLuGEnLuvIFOlqL+Vnf9aFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iuyMsTWyMfoi9CdfpyC8oPejttpazYpp7sqyuYqeZermc7Bghmwp+p5FURGnyLRM4eGgdbAi+QDVdc/rcGlhIoangzrszKEpMGMUjgT0rE/z38trY8ShqfUjrZadgZABV1XFF7LIRqVvcFKf1RM56qcLCzUyp8wP5c3B3lzY3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvd8yDWZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvd8yDWZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1490654a12.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873226; x=1792478026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43G5UMaTTnoQPBl1WablN3OxxeaEJ+ujwJ04caxRMu4=;
        b=qvd8yDWZ5u2RtQe19q0BumwdBN0IsaUr+DZFwyE2mdpd3/VkmLrl5cuqMpcz9hZJ6n
         G3M8jKs1zxkKNuRnfu70GHhtCMCURqhes+/TWalajcrZkqLwfcOSgqbh5dNUBPUey1pT
         S3huP1ug/x7HZz12orG1NyXijnIsyKpbaZPlbu4a5V9bWlWpzNDRNgih8GhWliewGiWz
         ipYnBVF+CLuNyj4dD4iLdcQ8KPyIpxlcZJdoLGukKmxR5C+ZYZSpCdrv7SmPKO773IyW
         FdG5Vw6cE51CMCza6Na5pZ+NC9IOqq5uqL8REizvBg4vIoDvKoHU9rqmr68qKFyzQssR
         OGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873226; x=1792478026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43G5UMaTTnoQPBl1WablN3OxxeaEJ+ujwJ04caxRMu4=;
        b=w+wq/gHjY0eDkn1zmT0A76xxBjWD+gFYpm9OI5yZkwLlmVdd+RRQs8gwJ8ePFg7SEt
         o2vMYYAtu2UOzUXFM1tSqOuwnEBytuZnA52WBlzBoqpC3BCelpM8wcfTN4WDPynDryEe
         k5yPB0L9K6gmTt83UlQXa1Ku2jKi5IPYXA8tHeGekGM0POM8pYpIRzpzNVcivekSAOQf
         pz+cpcOcFbCHRKOLMmjh29bWUgRMQSZ7yyJKqK/w/wIBcNcGa/l2Kx1mC2DLlKCaLsxF
         o/t9xA3TxOgLbOoJCfi7ucQknIfbyKOSUkodawBBd1bpY0nr7y4rqcOY2xs+tjISkI9z
         Rz9w==
X-Forwarded-Encrypted: i=1; AKwUvBz9z/9lN5O+HVO4KvwfmzdNUOncwGHqrbs4rvsqOVQ2jKEBCmmxCQnC0Gr1Y6tJ3OCo0SE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKeP9bDw7akaJT71PwbWHkwywmIenQWfVN3FEQqWf2pf/a9aTrD
	GCtArX39Lh957DEHXtLbT9aPHjsepnCJhw8QJRYqqE0f/DfSr/cmIkYb
X-Gm-Gg: AYBFou1PaKzT0bWWVu1nz47+J/bowAtfHZTVcHK+WQBgXNs9PcodnmJeMn9vScV/1bq
	xmuUCrW9uA5/7+Ebz9LyId51XZZyTvtSNBM6MBCVexeWIJso4prAKOHnbKYi9cefC42CqoP2nrr
	ov92WMVExJ4COebY9Xe84qosYmiUfdHAsgwroschxBZdLGpQT+fr+YtiQ7Z0ZmvdkIRzw9z5K/d
	755hT8AbG1tgobyPi1g2yBm0nE45ZaxLFNxruEoBRGiOGuHTEqKXN+bV/2jHELlY54uaTYyRiNg
	RtI5LwI56+O9BcSFKK0guJVNDteDoieyp48WYetoARJ3nkYVIn+LKVp+4mVOvO3lOuydRaQ1jaF
	FcxYufFA8UZhPb36i60ximQSoWw/JOoCyTJEulKseqfQcsgXezcGvpD02FxlYNpBuaOdsenm3LP
	DaesKvbqCwB3U8cK+EpHAJnw877HjNMkDZ0n8BkVHo7REvVT9WoQghbdJ37FQu9T3i3fWS4QxDg
	Xw1j9GkQg7EQUQLJM1lidkpT6PYuxbZje1o7cwz
X-Received: by 2002:a17:90b:2889:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ac0eebecf5mr3350372a91.36.1791873225873;
        Mon, 12 Oct 2026 23:33:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:45 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v9 03/12] mfd: nct6694: Ignore interrupts without a mapping
Date: Tue, 13 Oct 2026 14:32:49 +0800
Message-Id: <20261013063259.2734757-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- None.

Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index de0027c98726..4f5a5b855de2 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

