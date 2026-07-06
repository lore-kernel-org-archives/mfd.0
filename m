Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5673148BF
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329829; cv=none; b=e576/MHn8Nj88t/22O2cq/Kca/CsjNWr9NBhvStHo0qOgnzv2rQpRQagatTBt08qrHtTsKZ28rzubSzWbRMFX4pubT+QIXV9FDmrkgQ/KDj21pb6/Wf8ZwaDxg3ejAMKG4AnSCBDXfESV/2QIApL0LaRUxH4AW6qaXMlL8KGG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329829; c=relaxed/simple;
	bh=uf6iWYkBJPdl0xn669kP97vlXuaacTKOSMiQ6MKVP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZtOPcjJArGaqzVN3My546yWJ5ycPFUNcod37cpHdCSGK7eUTTCSK8olcgW5eNuM2nnTIHVtBOI35Kh5SYAZDMGYZZluJOgG+N1LvEhfMip4F1RadWKPjdtg/MQ4wENAqhM25+3U0Pwi63trhrg/YFUPJ3y8ygJ9K+9hwl537IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowAAnxs4fdEtq6kLxBA--.35266S2;
	Mon, 06 Jul 2026 17:23:43 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: rave-sp: validate received frame lengths
Date: Mon,  6 Jul 2026 17:23:37 +0800
Message-ID: <20260706092337.78754-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAnxs4fdEtq6kLxBA--.35266S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxGr43AF47Ww17KFWxWFg_yoW8tF4Dpa
	saq34Yyr45Jr4fX3y3J3yrXas0krWxKw4xtFnxJa4furnFq3WDGFWxGFy0qay0qwn3Ca42
	kr4Yq3y5Ka1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjTKZJUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The RAVE SP receive path derives event, reply and checksum
fields from variable-length frames.

Validate event and reply minimum lengths before reading their fixed
fields, and derive the checksum payload pointer only after checking the
frame length.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mfd/rave-sp.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
index c1b78d127a26..0057fbfa1abf 100644
--- a/drivers/mfd/rave-sp.c
+++ b/drivers/mfd/rave-sp.c
@@ -388,10 +388,15 @@ EXPORT_SYMBOL_GPL(rave_sp_exec);
 static void rave_sp_receive_event(struct rave_sp *sp,
 				  const unsigned char *data, size_t length)
 {
-	u8 cmd[] = {
-		[0] = rave_sp_reply_code(data[0]),
-		[1] = data[1],
-	};
+	u8 cmd[2];
+
+	if (length < 3) {
+		dev_warn(&sp->serdev->dev, "Dropping short event\n");
+		return;
+	}
+
+	cmd[0] = rave_sp_reply_code(data[0]);
+	cmd[1] = data[1];
 
 	rave_sp_write(sp, cmd, sizeof(cmd));
 
@@ -405,8 +410,14 @@ static void rave_sp_receive_reply(struct rave_sp *sp,
 {
 	struct device *dev = &sp->serdev->dev;
 	struct rave_sp_reply *reply;
-	const  size_t payload_length = length - 2;
+	size_t payload_length;
 
+	if (length < 2) {
+		dev_warn(dev, "Dropping short reply\n");
+		return;
+	}
+
+	payload_length = length - 2;
 	mutex_lock(&sp->reply_lock);
 	reply = sp->reply;
 
@@ -439,10 +450,10 @@ static void rave_sp_receive_frame(struct rave_sp *sp,
 				  size_t length)
 {
 	const size_t checksum_length = sp->variant->checksum->length;
-	const size_t payload_length  = length - checksum_length;
-	const u8 *crc_reported       = &data[payload_length];
 	struct device *dev           = &sp->serdev->dev;
 	u8 crc_calculated[RAVE_SP_CHECKSUM_SIZE];
+	size_t payload_length;
+	const u8 *crc_reported;
 
 	if (unlikely(checksum_length > sizeof(crc_calculated))) {
 		dev_warn(dev, "Checksum too long, dropping\n");
@@ -457,6 +468,9 @@ static void rave_sp_receive_frame(struct rave_sp *sp,
 		return;
 	}
 
+	payload_length = length - checksum_length;
+	crc_reported = &data[payload_length];
+
 	sp->variant->checksum->subroutine(data, payload_length,
 					  crc_calculated);
 
-- 
2.43.0

