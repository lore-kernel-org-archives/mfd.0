Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276841D4DE
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 09:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329045; cv=none; b=pdB7yEj2huMSS/YhOnAzWE8bvk84VpH4dVNtJt1fkRCQDH56H3dKwM1JnwasgcUOLpARbS2qgRixQLseoMDCDBngb4Eg+8+rR/RV8vUy4Me+Gxo3GHLitZW9mDoas8aet6w1coqQ1zeZ0Sfl1EvE3Q8RVaJNDf8y6nxhQ0ZeIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329045; c=relaxed/simple;
	bh=R+cxuvMzEmujC461/u9XRTpYYq12fr8dHe1FYPliz3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbv1EBLIVnj5lJgeeSX6D+2H7hQYns5raZK5hcK3eCphNADHGM7uHhvN8tQZRYeCNzV9ST1d7PsKC9Uhn+9anD+8P/P2wzLBChujI135+KsrKC3ugf3x8G7uODCw8YrMUBNpTHPl73ylXYMx7GHvs1urOPyF84/srmmjkTBWGz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABH5s4LcUtqg+jwBA--.35053S2;
	Mon, 06 Jul 2026 17:10:35 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lee Jones <lee@kernel.org>
Cc: Pengpeng <pengpeng@iscas.ac.cn>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: iqs62x: reject zero-length firmware records
Date: Mon,  6 Jul 2026 17:10:34 +0800
Message-ID: <20260706091034.75865-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH5s4LcUtqg+jwBA--.35053S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF4kJry3Cr4fGrWkWrWrGrg_yoWDtrb_uF
	1kZF1xGw15KFZ7t342kry3JFW2vrWq9ayrZFya9ayrtryqyr1kZ3s3ZFn3JFWfAr4UCF9r
	Gw4qq3yUA3ZFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUozVbDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

From: Pengpeng <pengpeng@iscas.ac.cn>

The IQS62x firmware parser treats the first data byte as part of
struct iqs62x_fw_rec and advances by len - 1 after the fixed record
header. A zero length record would underflow that arithmetic and leave
later type-specific reads without a valid current record payload.

Reject zero-length records and compare the declared tail length against
the remaining firmware bytes without open-coded subtraction on the
cursor.

Signed-off-by: Pengpeng <pengpeng@iscas.ac.cn>
---
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
-- 
2.43.0

