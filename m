Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028785;
	b=WL3Bb0cwJBk+G1mhkw2BKA/t2zAbXAQQRn3raxvCaLc61HdN6MwrWA9+0fCetj7kyOjI
	 ER0rNYQ+YTYpL/yn0zmktdCmRUnPI5CVpbz8D102fXAw61K7upkRrHGOYIoDEVqOfA3YL
	 PlWS77S1XahznW+FMr0ZjbIPg4KpYogyR43jmawMuqfykcsWWqQ1aExxrfDchSocgyI29
	 iiO4rRATCrS7MElqZmu3Ax7xukhy2PTX8RIH2U0k5ViVr4UZQGvKH5f4/0jTOD0QnOMgC
	 +FqthJiTYhsQj61s6fd6ELkHMUQ1o3dILVBlDoWYjPhB/blyB3ZW2V/LzWmf15aB+WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028785;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1L/sRvLXXTsA81LJd54Ga7im1P97da+8ZFczaoojjT4=;
	b=cCZIH5eAQFZOLRwHRXkPcYzjprQAEQY/kzrNloDrXX1DRshKrOxBxW0sjhNKwG2PGFCV
	 8dQqF7mw38Qk39nbasN+kSn1ZDXq0+oIJWQEm/wcISeC/ex25TYd8ugxf877R5WBKP9Ik
	 xvBV1wHX2FyoDLKRoe9rt0G0iaY9wcGaBcSJ1nHn23vmrYF/lqqwJUr27LDjS2nf1XNK2
	 CMBe5/xWybOeNVYpRy5Jq8t2oxj96JdrQcg3DDt6yYW3ZurcuK/FDFoF0PhJVB6P/479l
	 /S4BNDUWjdwCcs1gqMwyvFQRZPGbsr+9sbqNzg3IyJ9nf8a58fmY4bjHn/7ALpNk/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=LEXAjWIR;
	arc=none smtp.remote-ip=115.124.28.73
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630ED606A31D
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 15:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=LEXAjWIR
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793028775; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1L/sRvLXXTsA81LJd54Ga7im1P97da+8ZFczaoojjT4=;
	b=LEXAjWIRqKoe9RUBnHSGTolAlfutbKEPwLCve+dRKf4NnI8crAgT31fR6xeU224Jq31/6B1Yfz3by0o+fHvFClY8rr5C5I7REhGL2WcdOW0DL1z5jFCaoSUptRgZpPNeJ444KoiOw3aTINVTtiiHpb+CmKbQ+YikpqD7Aw8mTUA=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08317636|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00846258-0.000433577-0.991104;FP=5752320225235176881|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033040092104;MF=liuwb@xiaopeng.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jq7I2l2_1793028773;
Received: from localhost(mailfrom:liuwb@xiaopeng.com fp:SMTPD_---.jq7I2l2_1793028773 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 23:32:54 +0800
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
Subject: [PATCH v3 0/2] mfd/spi: sprd: fix ADI transfer length handling
Date: Mon, 26 Oct 2026 23:32:51 +0800
Message-ID: <20261026153253.689525-1-liuwb@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
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

Thanks to Sashiko for reviewing v2.

v3 only rate-limits the two new invalid-length error messages in
patch 2. The exact transfer length checks and the SC27xx caller fix
are unchanged.

The separate, pre-existing issue about writing back an uninitialized
value after a failed ADI read is intentionally not included here. It
is independent of the transfer length fix and can be handled in a
separate patch.

The series was rebuilt with W=1 and retested in QEMU (aarch64 virt).
The length matrix and SC27xx software path remain unchanged. A burst
of 32 invalid reads and 32 invalid writes emitted only 10 messages at
each new driver call site. QEMU has no model of this hardware, and no
Spreadtrum hardware was available.

v2: https://lore.kernel.org/r/20261015-spi-sprd-adi-exactlen-v2-0-13203b6aef7e@xiaopeng.com

Changes in v3:
- Rate-limit invalid-length errors as suggested by Sashiko's review.

Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
 drivers/mfd/sprd-sc27xx-spi.c |  2 +-
 drivers/spi/spi-sprd-adi.c    | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
