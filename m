Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415067;
	b=hYT2vVofE2osCgXGh3uUr+i2AO7w0CO72huZNrLPJ1aPn55ldXOwjxNOAxem7DrfXyxu
	 r19iyMDGNNw999UBaR1dXec7xdjhbHblDkbxMLId01iN4MZUYByQEJOw4kWxAw9ZbisB4
	 QRcloIKS+IzeJXSVyDbUWGhlgVSQ6BK7a/Q92svjzEgMseumxd3GQPW6SSWW+aDj56F51
	 CnUR9UDIFJJH2SamGxMJJudD/7bcO8q9uICBoJtfM/zvD9PaVQ7+X+5sCflXRon7b5Cj/
	 CFjsaHXQajUCfM9SN0UeTDMVyEudUaEFBmdQ8Mt/JJgtEUR022SOhZFyKc2ii6olZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
	b=hhPj1H+pyaBKvs79T6yXhk9ONucX/x3t1wmRk+QFkOhQJ06Fb63U+bRdXE3gNkjR41uu
	 53TXzaYCchl1PeZ7DukWc6WqKnT2s24+jX8jYBzc0ltwzlr1yEaIaZwEWVVbDspDZzGcJ
	 qSh0QZWN66AphBxDc08r2M0XXgq3qZsX3/cW1Jg53bVz9ayxP0bAOJuMl4IZmmD04VaAs
	 xL3kiaRhyGdoidQLmJowwTeNl5R7LjSoVRO5mQ6G2/+GKovR8wKWHgs2edMUxwPNWhJZK
	 TOZQjC7E6Q4x26RDrFijKt/kFXqtVt8z2BR08R68hAhW1n/PrNugNixCgGaRdZZw9qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgKelCli;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78AD60A2618
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78AD60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgKelCli
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490585eddfcso2629950f8f.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415065; x=1795019865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=tgKelCliQyE5aYHjkaCkvcqVuAmd/OJ1tz0hlyP+jR9i7neU/LgQyzyYzo67xM/WMp
         b/oZ0rbrU1sn6iMbPi/IUxobXcd0l79MEL2OcREOoHYCvOj4WqzYid4J+/1obSaSbfHn
         H5UZ4IvJaYyqM9fMI3Zds0jdGbpG6U2ak/ETTDV3EnaPuOZWZ9Il370axiXJMVtGrLQp
         oCd3lsecTjM9STO2fYSD+73NnlauEkt7wFGwJDvi9+7pCxYmQWjYmQ2rPkXDavHBx7qI
         /1RtzLGTaoCloClRSfJF8LNtS/BsMqzEqsMebRnhxjFo10+sH8o0l2/DXH9MdYHatn8g
         yJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415065; x=1795019865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezDZnWkAys7yO2bhUCT3pd+sWH0EXaKqpmbbWyxZlHo=;
        b=s+AIkqwBvpOVTcUbrN5Xb/puNW+Hs5aeWjwEg489ZqRjXv/JvNssepx1v6NvCcPXTZ
         Z4sd16XiAeyR4d98HgerkiC7CFMlEqGoJu299hxdy84mS/p75VRi/XbriNf8iG6j1J8o
         eMRlqWRJ2dqcz4/JBiC0hU+Uz2l1uc3zVPcDMND/ebOBbTTKMM3xvdBQMXnUAx3mRPOo
         T3KGiN3p6JDvRnj59gkxmZ5BCgEGCbeS5tZdUS0PAsct0ETlm3AI6QDLtUm68On3QqLB
         b+NNnN23GrQ2L8UpvYE/MWuzAdSmQqa87KYRoC/kR6UBNrp1aAnOss9Fs+U/clTMS2Al
         2tGw==
X-Forwarded-Encrypted: i=1; AL+hErEiE7U3PIoRYSA698NkX5LC3qSwZ/mMADNWI8yT1rhbTLMNIqzXYq9BEkzwtFhgHCdgifY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/oBPyDOVoajWU7JqgDw/m1K8AoaeMOMDieafUdy9FNCjuKIj1Z
	N904JZ2O/cWv4SaKiu4CW2Yw0JrOGMbqTQf48FfMzNnYXu5hP1mEJAxo
X-Gm-Gg: AYBFou1E3CpKvztjIZBi5h9BKE15bPNDusBsBcKLOm/ABJOAJKS8LBqZ1DsDNlFBV3q
	MPGaSbh+B/PrcI6HBk5Ig7pTU0PrAS0+EbxjtnAcdBl+4Q+qUchmS3VpvI2YacbMm46CUjUQSwD
	5dbqs9zShiWdpJ9kVIVyPIWhY05mb/OS9oGiTA74P/MLvU99+SKt/vrWY1VPYyNTCWX6UL+1oRm
	Irux5v0+dYXOVrBsIwcOZ21ihCE8HZZPm2jcxG3qyY+BubBk8JrnAOC1yC8yOq+yqrYRWHUIfo4
	nkx7zv/YP94MehwnBweo9jo2iR7bXfR0ibwdudlhx1vadqMp1fPj3ILt9WyuRLjdscB8iwTJGqC
	88YbcSW9ft/JfmX9ODBIr2khWav/gphZlN2YNjXB/2/BRalMDC3ZU3rQEMTD4v/jpGKdvJ1wUsK
	+2eiEFmPlabe1RsroXfwF1QKJvX+W/48psjuRZwYKym9y6GT6+dg6W7xsU4gr+4qGUeRcF8xqp5
	iue00PC1LtypInWh4DS8pYw+ADXb3+ZIkcLjNcMPSDR8Aar27HiI6xE/J/ebvIZe0qroEL6LdnX
	v/1HGwYoEuOuWjngRRLsHv/wNx48wZpsuaSxaLT4Dwrxsxk+zMYMig/k6LyifBhY0CY8Bix00s6
	Xkb0lQV0MoJZ4
X-Received: by 2002:a05:6000:230f:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-499c69cae4emr5038162f8f.18.1794415064910;
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2bf91sm12200583f8f.23.2026.11.11.08.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:44 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 7/7] zorro: warp mfd: expose the Kickstart slot selection
Date: Wed, 11 Nov 2026 17:37:34 +0100
Message-ID: <20261111163735.227286-8-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

The board keeps several Kickstart images and the ARM boots the 68k from
the selected one.

Writing kickslot makes the ARM reset the machine on the spot. That is
how the board works, not a crash.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 .../ABI/testing/sysfs-driver-warp-mfd         | 11 +++++
 drivers/zorro/warp-mfd.c                      | 49 +++++++++++++++++++
 drivers/zorro/warp-mfd.h                      |  7 +++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index a8213affb153..8cb7df076e15 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -40,3 +40,14 @@ KernelVersion:	7.5
 Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Fan drive, as a percentage.
+
+What:		/sys/bus/zorro/devices/zorro<N>/kickslot
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RW) Kickstart slot the ARM boots the 68k from. The board keeps
+		several Kickstart images.
+
+		Writing a slot number selects it and makes the ARM reset the
+		machine at once: that is how the board works, not a crash.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index a438faeaa232..637ff4eccca3 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
+#include <linux/kstrtox.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -302,6 +303,52 @@ out:									\
 }									\
 static DEVICE_ATTR_RO(name)
 
+static ssize_t kickslot_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_reply *rpl;
+
+	rpl = kmalloc_obj(*rpl);
+	if (!rpl)
+		return -ENOMEM;
+	ret = warp_get_status(warp, rpl);
+	if (ret)
+		goto out;
+	ret = sysfs_emit(buf, "%u\n", rpl->diag.kickstart_nr);
+out:
+	kfree(rpl);
+	return ret;
+}
+
+/*
+ * WARNING:
+ * changing softkick slot will initiate a forced reboot - your Amiga is not
+ * crashing, it's the ARM MCU that is abruptly pulling the plug
+ */
+static ssize_t kickslot_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct warp_mfd *warp = dev_get_drvdata(dev);
+	union warp_cmd *cmd;
+	int ret;
+
+	cmd = kzalloc_obj(*cmd);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->hdr.cmd = WARP_CMD_SELECT_KICK;
+	ret = kstrtou8(buf, 10, &cmd->select_kick.kick_nr);
+	if (ret)
+		goto done;
+	ret = warp_exec_cmd(warp, cmd, NULL);
+done:
+	kfree(cmd);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_RW(kickslot);
+
 warp_config_string_attr(boardname, board_name);
 warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
@@ -324,6 +371,8 @@ static struct attribute *warp_attrs[] = {
 	&dev_attr_tarm.attr,
 	&dev_attr_vbatt.attr,
 	&dev_attr_vcc5v.attr,
+	/* RW attr */
+	&dev_attr_kickslot.attr,
 	NULL
 };
 
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
index 4fa09fa972d4..6bc7b38b5e4b 100644
--- a/drivers/zorro/warp-mfd.h
+++ b/drivers/zorro/warp-mfd.h
@@ -59,6 +59,7 @@
 
 /* Command opcodes. Only the ones this driver issues are listed. */
 enum warp_cmd_id {
+	WARP_CMD_SELECT_KICK	= 5,
 	WARP_CMD_GET_DIAG	= 6,
 };
 
@@ -72,8 +73,14 @@ struct warp_cmd_hdr {
 	u32	cmd;			/* enum warp_cmd_id */
 };
 
+struct warp_cmd_select_kick {
+	struct warp_cmd_hdr	hdr;
+	u8			kick_nr;
+};
+
 union warp_cmd {
 	struct warp_cmd_hdr		hdr;
+	struct warp_cmd_select_kick	select_kick;
 };
 
 struct warp_rpl_hdr {
-- 
2.43.0

