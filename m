Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F41037E2E9
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756828; cv=none; b=sOhhBURaaDRyJJF0Q0HlbEpsGX0fOYpmu6sr5ChPY1yQp2cATKmJa4PL5aUlq4n8zQ/Vy7CsH/BqUiXdngYpijmubGW3PvKFwNPSd59luDTkymESQM7Ladj7WqKEusV5t0MiM9K/97m+CYufYzI8+FMhGOyqDzefGqAWj3LWZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756828; c=relaxed/simple;
	bh=LeKSx8H2lAV7UH366MM6ffVBafmYlm5RPT0bQKnfZC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6e/PRtPGD5KdxxorByIQ55VQzYUv0nkc3HpO2OT9k/W15uDL124FNaXBHLAHo6sTlC37OjKA3V2ldXiJIOztuZu4sn8t/QzKIOJKSZGVgeRNzLVASg5yDQ9shwgAaAuSNOpIeXyB+3huVAjqwv4xH3bOSU7Czj1LcUyqi2X2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7EqaKaJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7EqaKaJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2094674a12.1
        for <mfd@lists.linux.dev>; Sun, 06 Sep 2026 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756827; x=1789361627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqkW9SdGFzOsD4u+Jwxf7Q1ZRd4OvLy56qPATyIkONw=;
        b=O7EqaKaJo4S5SVLWG03ygFXBF40MFSlfhyfY4yZ/tt6aLp3gQRm9PG/0wmauMS7eus
         Ds7LMKRF5JtiDcpidr9yuxbrXpgbeNjVZ7rM6hZMoEv44qkZFcN61zT+fRHxgk/0iv2m
         W0GzgllKYowQhjQHuisQv7s6b2OFPKkfWYu/riJCp9ulFNrl4cylJ5xCbcAeT8ltrDv1
         9vmBF7kKxEq/NRyc+ru5uzL670ps6SdygFS2X7VUUOqZjxBAhL/I5TxYafO3dP+8JJ6q
         dwus8IEc/3Su3u44PquIAAyvX5x+SbictenWH4GUBAuMr1uXE2HzE4ApC87OIHH6qWNK
         Nv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756827; x=1789361627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqkW9SdGFzOsD4u+Jwxf7Q1ZRd4OvLy56qPATyIkONw=;
        b=VmEyq8TXJeXo3xr/Tet7XTXTE3yms4UhDqTVtkbceFamzParkzRSpP6hMBc1ISDY5/
         YZe0QiRtgnqi8uF14efHqrUhuu63vUwZKRdQP8ucirltfV+/Of3b3CtygpiSeF1vFpiW
         Ed7i48FeJ8OiTSiL1gfzz5zLGM3O6ewVhroCDIR8jlwlSwhhTvh97OEYnpXvEPLVGPpA
         bIGkNERS0QTmNkuUOdQGDIjTAP66A8YjdSg9DZRI6kyjOEee/+w6aWhI23pleKJRj4us
         4p+gvTSzefJsRtrXCeKaIhm5G+7XfKFqi70tT7lBEZXPg703zRicuoluE927LvMuH+ef
         Fqlw==
X-Forwarded-Encrypted: i=1; AKwUvBxLo+1hxAfsqaM2lb8mw9tbpzZsPXk1x5RBTH8sIyAaDnnPIrn9oNF9wpL5Nggl8BEye2A=@lists.linux.dev
X-Gm-Message-State: AFuF++m29sFr3z51FkoyLr7YVhf9MEdVreIJzpJY8KX/OqmzltL3molN
	HRHe5fxBecGBUFgKbaPcbwC8+8o45TZMTF7AGJjF7tEG9i29Thf1KVLt
X-Gm-Gg: AYBFou2Q6NGPgLqyE7ypxj2KwOck7WqjUc+cD6qBQIBEmo9b7QaNwlbousfWIRXd1eT
	VmcmgTjgCBo4xvMcGEqj/vjev1CewzzLqBFMAecEJ38u8lgWxWeof6MDk8tFg8DhNNeQ5TePq4C
	4clFLir7lWJi6d/EQgYEbB3bPYA2BWiYx3ZR3/ZbMCdP2o1y/z29Ygt4z6YtOIsanF8a4bBoY7e
	fRvG3WZu1LHawT08tc93WIER9f6Y3b9v0PSJQ/f6f/K6F5jfCj295YCYYRT1nkECKPvx4P8m+JU
	cohmdBNL8g9Yw7H+kLcJP/+IqLHlNlD7fakzG0BhR/xdSrqJ/ZnLq66CF396okCpbgg9Mv6TiC+
	TPmZMbuelQnGLWLRK/Uc3ClGF8ZoG+Cdocc4c5fBS0jhwq2tLxyAMnRO8PpfgPkSbuu8wgfzIJS
	/lj8B3y0rwkt9Y/e0ifIpMxX5kRERaQcD+BZaHElT35otC4vz8aK7h+VCljBjCuFqEb+KO7O6oI
	pbs8NTMug32sw==
X-Received: by 2002:a05:6300:6690:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3da3a120478mr28353285637.16.1788756826611;
        Sun, 06 Sep 2026 21:53:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37923958eec.16.2026.09.06.21.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:53:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/3] firmware: cirrus: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 10:23:30 +0530
Message-ID: <20260907045331.16932-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index bb93b24c659d..04015280ac5d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -3505,7 +3505,7 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_write, "FW_CS_DSP");
  *
  * As cs_dsp_chunk_write only writes data when a whole DSP word is ready to
  * be written out it is possible that some data will remain in the cache, this
- * function will pad that data with zeros upto a whole DSP word and write out.
+ * function will pad that data with zeros up to a whole DSP word and write out.
  *
  * Return: Zero for success, a negative number on error.
  */
