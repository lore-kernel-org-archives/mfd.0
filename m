Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E4406813
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548468; cv=none; b=SGpH75R0w7s8NAMUZDiuta39QqixMJXXkCf3OF2Wqr50xQwxYl3/TKAG4xvZUXWZ4LhRxkcKK659KYTZjeKqvB038UXzFpHh6qnZQvdR+4AwP2MtxQR83N7/U9CcuZMbc58iRHWq/bF1v7rdZqLmg9aY6FLSAMBerWcg0BiYfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548468; c=relaxed/simple;
	bh=xMLv/hu9cTvIQN4MzNA29QMqgKihyGMt1dCzLhIWZCk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DHz3oJBKa7BLI4REGXpQyZ/+o54RED5ewtgzrq7rvykc9S910J84DL46Pwwlg70vyRvjq4PMVJr3cq9E1azl95S9lIpe/Ls8FUkdZYbeXCpj4NKKuyDeBfIQx84lqUqDbqxXTVevKRQHLu/SPc1ueduEkMeCXp59Y2EatQ7phbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADXRD9vDF5qg82IAA--.52498S2;
	Mon, 20 Jul 2026 19:54:23 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] mfd: iqs62x: reject zero-length firmware records
Date: Mon, 20 Jul 2026 19:54:23 +0800
Message-ID: <20260720115423.94994-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADXRD9vDF5qg82IAA--.52498S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wr45Kr1ruFWUZFWkCw4xCrg_yoW8JryrpF
	W2kFy7ur4qqr4xGFn5A3W7Za1fCa4rJa4xWa47Zan3ur13tr1jga4Y9ry29ryrZFWfKF4j
	yrs5t3s5AF90yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0pBTUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

struct iqs62x_fw_rec includes the first data byte in its fixed-size header,
so the parser advances by len - 1 bytes after that header. A zero len makes
the size_t cursor update move back by one byte, so the next record overlaps
the current record instead of following a valid declared extent.

Reject zero-length records and express the remaining-size check without an
offset addition.

Fixes: 4d9cf7df8d35 ("mfd: Add support for Azoteq IQS620A/621/622/624/625")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260706091034.75865-1-pengpeng@iscas.ac.cn/
- use the author's full name in the mail metadata
- rebase onto v7.2-rc4

 drivers/mfd/iqs62x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
index ee017617d1d1..412ae7777f72 100644
--- a/drivers/mfd/iqs62x.c
+++ b/drivers/mfd/iqs62x.c
@@ -237,7 +237,7 @@ static int iqs62x_firmware_parse(struct iqs62x_core *iqs62x,
 		fw_rec = (struct iqs62x_fw_rec *)(fw->data + pos);
 		pos += sizeof(*fw_rec);
 
-		if (pos + fw_rec->len - 1 > fw->size) {
+		if (!fw_rec->len || fw_rec->len - 1 > fw->size - pos) {
 			ret = -EINVAL;
 			break;
 		}

