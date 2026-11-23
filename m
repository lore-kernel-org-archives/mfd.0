Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432760;
	b=Ry4g/E9Eyix/OyA3bFDCWM4hf0ECC60/b6UqFC4MyiVGj51X1AoKdozCoLyLF/cQ3AFp
	 65a7mxGjUsyaByxDb4NLU9CRLuJ/rHSiUGUe/8kJQ1OeT+SI6Ai0B/wYsrExFaIAFcXjK
	 Eq6MxPs07Nbc/g1Vruon87JATWpNHc3JAz53/EnbGz3+SHHcg6EiJ9zLUaCNRTXyi+4l/
	 GLHF670CS7RqEHCzn+epC23XKJd5Kg/Du8erFG2D55qOt6ANlT3kG/tNg/4V04yp6wHPr
	 cYu7k53VCwFzKpPxia4HDb+LO4+Ea/j3j0ZBjcWS2XzP7fFh9p/ChxD1wh34wAQOgCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
	b=dvy8RiGAX+aQmZpLGfLfDZnaaLiGHBhs3ii1ggD10rLBqKT0EqGeAiGaLgi2gTflmTYF
	 BNviS8uX6drBG9TRNSl8To8S/LXYvfH/MBczRHGBKaQKpclw8skC6E1tcDLwRlRleXCzf
	 6iLfalNRy66xmM528y6woKSZY4t7QuVUhDcQzS3FH98E6vAK7JnpVEdrlLHfdxcv7xNIu
	 6hzeipRKAJkbnKGi7MTtOL6wuCikTRU4wicLCdgd/c69lB4G43lqlby5Z7RS5W38oFnPf
	 fa+2ZaoxePq4PDgoGSxN7HgWnCDZfbTN5CKnwgv5fPeONKBBbSRzr04HLNMw2W8HDLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ikB3k6oc;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873AE60A260C
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873AE60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ikB3k6oc
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so30446595e9.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432759; x=1796037559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
        b=ikB3k6ockq0/1ZJpKgDsPNkBTH8cXsbmHJOJ/8uqwXv5sTouyCS2MCzfZI889UiSXD
         wUaa9fWWly9peckA3fWpVQTxcm72rX05LMwINxj6P+jEanHaWLl/euonCv0Zz7Ew6FwQ
         nPeoFd0RphKh3aPMbJqNxRalQYK06Fx1j7Hk9rEbkx9HFWBHijbU6Kna9gLYeffKXWgM
         sb9ln+cW8O6m5AEGMU/7C3r8gmiKdVHsyJNidGX96wyRAI56j4h/jfj73UkccIkYStTH
         RWa3/qH4ogaHGenT6D0JE/5Uf4E4StZkSJkpkzFGpm2CVjsOaKv4bIdjRHlX4y90Cegl
         c0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432759; x=1796037559;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+ac4e8fXiZIKOXTSBDTqVlqshkMfShyWtCswJZ3w/0=;
        b=FD189cRR0P5BKh053tlTrwTckhQYL0LfWs+HaHEjhF11cS3wYzCERukFI30ktcRlUh
         RnMB8CHJ5Dw9CLZYRphx0801WffROdE36bL9bdTEH/9f4yUAHgcd4YYdhPeIFaI4gGAy
         orDSQfL+IfB7a4v5TJAejwx7o9EEwvTd09oWZqyWtYElY8HM3netYrXzOw3eCfB0pk45
         znzKfb/bqGYv3dcQE8sp8Dg0Dxfw+Zgt9KJDt4DkBE0Ogs0fnoLm8vpd07Mts7+G37y1
         1rzEUn1QK7WLs8tKGeMVxlZWwyN+oMJEIcYYv0Oms2tN+0TePXq3KHPOfrERDHgnGr9f
         vZ6g==
X-Forwarded-Encrypted: i=1; AL+hErFaWiOJbT+uJZ+avzHmTNJAgcP0kbFRY/CTzXzZLsI4f8MiFwXtAPRVR8QNOQqBDHN8R1I=@lists.linux.dev
X-Gm-Message-State: APuU4Z8CQCK64u6PXghILhXuapPpxqlCv9lDgX7LZzfDFTOcvPbPFOrk
	up16kLAQCegKXu2BH6yqTt1/D1p5bgWVQRMjssi37BXtCZpvxm0sZ37foTAB/2DScwk=
X-Gm-Gg: AZFdTZdFwlYkNG8ws2AYRqkUAkfJ3oHqGzP1raUQtg6AFr8VR9A/J18sr58czNQF9/5
	zSvj18QC8yWCUJ7StUIcbPA28LzuQFhmmUb2OIX7cMCSE/6Zuw/BTtgLiTEqOESQA4moGpRQzf4
	P3Vc9HvdnFfzilpWbtY2x+AtEej4oU5s8glRHdxv/IqlgPJCRGqvMZzMIlftx4NOuEil9veSdiX
	8PWPlwp32Fb36FV5ouarmEqDXhQFuIb5DbKQxz+Z/BdC26LX8vfDaNuHP74/6uOukMiAGWXMO0g
	qOTUk9PzPPc6pgZCwY0nti9e/MKkyfaOKFbtRbHhiDHwL8WiaoOgd55/i9GOOnARbBSSRi7QH/C
	FCqRHraQ8sBfSn/B9NpdgApRSralr296AU0kul0Zz/y+nkZOcVDwhb805UfB+RHEDAAZVn9JgTr
	cOLLxLXHCB0VJG0J0Q9+JdMCScPG2UallK5Oq5ceZAxs+Rp1CJW2k4WXBcmUDbvaHMB5qz9ATEp
	25wuPydlAdQGR9nk0WEPKVzT10Nl2P3v53wdIJmWKpZj5DPl5ooDzwO1okekeZhSg1IKZsPpIt5
	t6603TROdihaQV1Jm5bjO7mjP8zqvGR+obCvo+BIT/7BENZDp9t9nrhICUM40RR5UFmpbrjlKlx
	kzvzsUs0nuv37EFvr
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr218980625e9.18.1795432759010;
        Mon, 23 Nov 2026 03:19:19 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b3a7sm392572185e9.3.2026.11.23.03.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 12/17] mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
Date: Mon, 23 Nov 2026 12:18:10 +0100
Message-ID:  <7806c77d2c777eb52ed9f77673161d73220ae996.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=DqHc8cG25xY/Lzd1sVscX5JVymXLlLJWRvcHUkSIYIM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEF7/lyc5lYuiFfMbU4eDXgBUseUJLfkDmm/ vOvcdmTQ3yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhBQAKCRCPgPtYfRL+ Tg2XB/4z1XPxNo8oxJrqHU1Kc0kRNCOJLctkwNTP27gqiZi1dpswf7+6qRYZye0e2HSH6L8q+Nk RPvhSVReBrF6P8GYVXMqAYMYYk4jMlPrngXFdpZax4287pjYhbMd7hch2imGDN5rGYVSsS+XFNm jWiB7yfhkFnfOZ753Tb0QQp8IbnIfMUwUOoRC5wchv88MUqC/b9JEcbUhCOOfE8cXeT4YcDro/R 4qKnjxZx3DvzxO+EgXpMm1A7/KeOCdTEsJ4jZzqarA2afWJ0lzHJHOqhparwLPxnS4Q7H/sbDQq fNw8T8cVwnZOvq6kl70YxMnSzGXU2c9EGsX0rSTJvoyvekax
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

pci_device_id entries are usually initialized using these PCI_DEVICE*
macros. Adapt to this more usual style.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ioc3.c        |  2 +-
 drivers/mfd/janz-cmodio.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index a86b4e6b8f77..34e4db8c2226 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -661,7 +661,7 @@ static void ioc3_mfd_remove(struct pci_dev *pdev)
 }
 
 static struct pci_device_id ioc3_mfd_id_table[] = {
-	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3) },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, ioc3_mfd_id_table);
diff --git a/drivers/mfd/janz-cmodio.c b/drivers/mfd/janz-cmodio.c
index 036773b3c4ee..a0cf86460a23 100644
--- a/drivers/mfd/janz-cmodio.c
+++ b/drivers/mfd/janz-cmodio.c
@@ -259,12 +259,12 @@ static void cmodio_pci_remove(struct pci_dev *dev)
 
 /* The list of devices that this module will support */
 static const struct pci_device_id cmodio_pci_ids[] = {
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201 },
-	{ PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202 },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0101) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0100) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9030, PCI_VENDOR_ID_JANZ, 0x0202) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0201) },
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050, PCI_VENDOR_ID_JANZ, 0x0202) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, cmodio_pci_ids);
-- 
2.47.3

