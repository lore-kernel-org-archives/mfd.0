Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699181;
	b=JTiL2AH6C0g612UG7jCig7MtYgkAy41BmpGsRK+urVc22KOD7Ymw/h2kWejSWSBUlC3g
	 RQwVTam27TS2wK75S3fEsaNroU+wl5xi3X3eUp1e+R5gfQW4vFII4VHLP+A4B04f83Ehd
	 XKCkX9Q4z24U3dYmtkFstw3QSnG8+GMQZEsD2WkkqM6Jxm2B4Agt8/hRARxCVy57LW/sl
	 AzWDB9PIbiFEPX+7dzrwXNNUIcX3pYRnmkd8y/5sfTRBtNl1MiybfIaSVnKCMAz8i+CBs
	 J3oOPjeEeffII8btZqBzgvP2fphkFxo/RFp/DyNGo9VHYptNp3zSKvQO29ogRYoRxFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699181;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=y0bvXf1h7Wz+f0YJZfiRLxuceLa0NyfzQU1Grzqc+gw=;
	b=SJN15T8qP73YlejcAPq30YQaYE59SQZdesA+Hz+RL4a6fiHCb1p1aIb7bevenJzsKOaj
	 MuPyrRjJiquy74aegQRksNXLJKXkUf/6I/8A5409Twyaq4SXQ051A5o8N4UnxqicR+7HS
	 pf2w4UFMMMeJikst6hbNJ/A06I2mlYz5Mcl2YIUjOfmof6kqzXxou2BNnJGl+q11jc8Ur
	 jDqjxHHV41nPzF7dB/ZdjC8wgAVvqPDIXavDqKHdZmiVrxL6bNBrmmy9dTFDElPQJtJZV
	 Nlb12dTlX2HOJEEBRSjRFNByEV0J44lgyib8+/HR7FlJMYrZW9C35k4g5Orwzsp7Fvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7586082BE8
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 09:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D7586082BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3xZZqrelqSU87AA--.2335S2;
	Tue, 03 Nov 2026 17:46:18 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] mfd: adp5520: Release the subdevices when the client is removed
Date: Tue,  3 Nov 2026 09:46:27 +0000
Message-Id: <20261103094627.1289646-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:rQCowAC3xZZqrelqSU87AA--.2335S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1DJw45Jr1rZr4DWF15Arb_yoW8ZrW7pF
	47Wa43Crs8XF12kw47Zr1rCFyrAa1SyrWUCFn3Gw4a9F45CryftFyIqFWjyF13CF1fCa12
	yw1rtFWUAFW8CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWx
	JVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UXID7UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEAA2rpnOFPGwAAsk

adp5520_probe() registers up to four platform devices (keys, GPIO, LED
and backlight) as children of the I2C client, but the driver no longer
has a remove callback.  The callback was dropped when the driver was
made explicitly non-modular, on the assumption that a built-in driver is
never removed.  That assumption does not hold when the I2C adapter the
client sits on goes away: the driver core still calls the driver's
remove callback, and without one the child platform devices are never
unregistered.  They stay registered, keep a reference on the I2C client
device and leak the memory they were allocated from.

adp5520_remove_subdevs() already exists and is used by the probe error
path, but it is not reachable on the removal path.  Add a remove
callback that unregisters the subdevices and drops the interrupt, in the
same order as the probe error path.

Fixes: 6b09274bacc7 ("mfd: adp5520: Make it explicitly non-modular")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mfd/adp5520.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/adp5520.c b/drivers/mfd/adp5520.c
index bd6f4965ebc8..6b53b00efe52 100644
--- a/drivers/mfd/adp5520.c
+++ b/drivers/mfd/adp5520.c
@@ -305,6 +305,16 @@ static int adp5520_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void adp5520_remove(struct i2c_client *client)
+{
+	struct adp5520_chip *chip = i2c_get_clientdata(client);
+
+	adp5520_remove_subdevs(chip);
+
+	if (chip->irq)
+		free_irq(chip->irq, chip);
+}
+
 static int adp5520_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -341,6 +351,7 @@ static struct i2c_driver adp5520_driver = {
 		.suppress_bind_attrs	= true,
 	},
 	.probe		= adp5520_probe,
+	.remove		= adp5520_remove,
 	.id_table	= adp5520_id,
 };
 builtin_i2c_driver(adp5520_driver);
-- 
2.34.1

