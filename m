Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347353;
	b=TO66V9gyBgiJLmsYTeHu2Idzjc24cdJI4LFhaT22ACPZX4Dt20NHYiHpLMBmKeRUzdx3
	 4aswvr53xZDHtVuvuWcm2ROg3MNlfL5HihrCL2v4L6uWJv5ESNBpjyLC8e8sfUiotpozV
	 PCdDHpUv45Ga0rwQ862H66d8Qpit6SMqM1RxHsqs8XxOPoyquQQocb/dmKwqJEpuQYDBZ
	 Zhdon8niiXaNNpcqQPi9kViNvhzYLSpUuxvdjXssVqZMyvo9scvBUoXYZxXNQ1l87SAiD
	 OrO63r/DSyZ9Lk0tUR9RsaJ7Q6sNOtcTUf3tXseV6HvHJFBRH+/1NPqgXQOjIpV6s2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347353;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=KhH3/ntoyorUoRnbCabrr5P7SSAKGYQSV0N3Qci+I/k=;
	b=Iw9oghrZccebOwZ/DrFsziN1vbA6/iq58vNbw070Lpc09z3fkKo3MKk/AkWCjVUcplj8
	 IEi1vFW1dqZM2jJRgRClDxQYsYB5plvmMArYjnj/w8c69N+tWmHKS9CBPtcgV7P5N+ABS
	 ajJ2C5QGMjqloHavBxARc67HJrd3ghu5OSw3tybjKhrJICeZ7Y1ddCge5y07smU/qXdFP
	 4/Ewf9RJqAo8fFCes0x7kkhQbd/8giobu0I5DzglyGSh+kOBNTnaMj07A0nkNM7ONQOf/
	 oCreYfY+w1z8I7kepl0hkKnuZXimLLBfeteCDn0IAcCw22na1LioYZCUSpjb/w6ZcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=g62POGcG;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FD5606A320
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 11:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FD5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=g62POGcG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KhH3/ntoyorUoRnbCabrr5P7SSAKGYQSV0N3Qci+I/k=; b=g62POGcGOfhGN
	Hf3KQvZxTxe1WhEuupyeUHzQ/reQBRdgqWayQ9Nz1mUT9EMsVgc8kFs7OFK6rMWp
	xYFdbTZ5h6nw7aq1eMFE9ZwXrybMeiwYRYsZoqLZdUc1rvv36fwUsMIvn6Da6Y+c
	lBGl0wy4Kg7jUQlqdxva1I8ib2gl90=
Received: from stmpe_v2_send.eml (unknown [58.206.202.11])
	by web1 (Coremail) with SMTP id yAQGZQDXRjeM0wJr_JCqAg--.53142S2;
	Sun, 22 Nov 2026 19:35:40 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: stmpe: Disable regulators on probe failure
Date: Sun, 22 Nov 2026 19:35:30 +0800
Message-ID: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yAQGZQDXRjeM0wJr_JCqAg--.53142S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1rGF1kGFyDZr47Zw4kCrg_yoW5Ww1kpF
	WDXFyFkr4UWFW09r4DAr47Xrn3WrW8trWxGrykW343Xr1jvF9FqFykCr1Yv3Z5Xrn7JanI
	yF9rXr18uF17XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7Cj
	xVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU5GztUUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAQYTD2sCG5iHcQAAsH

The VCC and VIO supplies are enabled in stmpe_probe() but were never
disabled if probing failed later, leaking the enabled regulators.

Register a devm action to disable the supplies, and track whether each
supply was enabled in dedicated flags instead of consulting
regulator_is_enabled(), which reports the hardware state rather than
whether this consumer enabled it.  Drop the manual regulator_disable()
calls from stmpe_remove() so the supplies are disabled exactly once via
the devres action.

Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
 drivers/mfd/stmpe.c       | 24 +++++++++++++++++++-----
 include/linux/mfd/stmpe.h |  2 ++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index fd51ba74275c..fb30b8a4fbac 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1362,6 +1362,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	}
 }
 
+static void stmpe_disable_regulators(void *data)
+{
+	struct stmpe *stmpe = data;
+
+	if (stmpe->vio_enabled)
+		regulator_disable(stmpe->vio);
+	if (stmpe->vcc_enabled)
+		regulator_disable(stmpe->vcc);
+}
+
 /* Called from client specific probe routines */
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 {
@@ -1410,13 +1420,22 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 		ret = regulator_enable(stmpe->vcc);
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VCC supply\n");
+		else
+			stmpe->vcc_enabled = true;
 	}
 	stmpe->vio = devm_regulator_get_optional(ci->dev, "vio");
 	if (!IS_ERR(stmpe->vio)) {
 		ret = regulator_enable(stmpe->vio);
 		if (ret)
 			dev_warn(ci->dev, "failed to enable VIO supply\n");
+		else
+			stmpe->vio_enabled = true;
 	}
+
+	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(stmpe->dev, stmpe);
 
 	if (ci->init)
@@ -1489,11 +1508,6 @@ void stmpe_remove(struct stmpe *stmpe)
 	if (stmpe->domain)
 		irq_domain_remove(stmpe->domain);
 
-	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
-		regulator_disable(stmpe->vio);
-	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
-		regulator_disable(stmpe->vcc);
-
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
 
 	mfd_remove_devices(stmpe->dev);
diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
index 87e29d561e22..eec5fc795014 100644
--- a/include/linux/mfd/stmpe.h
+++ b/include/linux/mfd/stmpe.h
@@ -122,6 +122,8 @@ struct stmpe_platform_data;
 struct stmpe {
 	struct regulator *vcc;
 	struct regulator *vio;
+	bool vcc_enabled;
+	bool vio_enabled;
 	struct mutex lock;
 	struct mutex irq_lock;
 	struct device *dev;

