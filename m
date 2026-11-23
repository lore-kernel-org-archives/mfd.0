Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474866;
	b=3cf3NAB/sGDslQXFIjHc0xAIpedjYOIxGioTX00RYcwHk8mj9cTdj8ih3i2oyLy2uRvE
	 rLss3lbPkBX0Uxf0TFYbQPiTHXGNVYsjouWe/mVlwQzavrxiKh+1BfFaVjPunmcJghqWQ
	 IEnc9bH2ufSeQen1/v8x/n1P6ZpLm+Fp73kYz40dUOJ4m7YaJE+1OMfCp8XwG2Aw8jkTY
	 aPFMlwAuCSYp3LzJ9USbZdf9DWtwvol43AwDcXFEQfKT8UH5UP6q1oXTyB1zLeEfW/Dob
	 bJTUYxjPDwk9MJIr2hLFeRwisNcY/til9b4SIXYc/dlIsw0pu525k6Tn92wAXbcVpAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
	b=zKYjrwTWV3sChJ8ZORYG3nI02zmSFp64DdM1WSt51GLQuDSNZOaKe7K0mZ1iGtJyWNbt
	 ANbaAspn5cg8J28Xafs5QSVE4K/Ovtx+GKSJ8QauSwafh5Aw1o1K9eLt7NRI5xLwxN26B
	 b8HCPtsfEF+JcF+VqjdInvIno3C2CR6WfiIYrwKuwyoVxlcHnIrAXLz+cYCoXqyA9UnwF
	 rpIA8mAjT8wv/TWzrGcuVB9v5e1aP5Pcq4L/8nhgurU8nbXvxXm44gIcuSI04+J5KobxZ
	 S2Afbf1zrItEOO/+wkvYnIaUCxP0816Z2acmoGnMlATHi/MJm3JQjC3GqwWDzT5tNOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwFCEXEe;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84613606A31E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84613606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwFCEXEe
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38644aedba1so5878430eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474866; x=1796079666; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=mwFCEXEez3KrsEV6d0KxzPavQoykC+q8LgV6uey9+01x/H4og6KcOgCz+/+/JJ7+Zb
         QZEry+OFMhzq5bsRB8ARQI5pt3q6d4FbbAxuED3Xyj+G7k6yHA9B0+E9lPgHmr3l3Vvf
         ZEf7/9o5UfGs8gSrPUdDRoe35D3dEia/08gyKuozURUX6SjCGFiEVQrVwT4gb4OxhOsc
         g9UTMrL5H/RrHS/1QVLKrW24rP6etJIysY5+/BumMIAbQVbpPzevNCflu7j4CMs45262
         4sGrcwaLNSGlufGGfpwahFI/Q6bUU84d4MLVanhmjtAEYrkjgz8OQhQPsUIa+7Gm8zvl
         hb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474866; x=1796079666;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Aqohkn9z53SBY8rROqhjekaytCoqauZetpa7fBs5LxI=;
        b=R2SghFZRd0EqCRNjbZ0X9VcWRh5QqInLQEqDX8zwFgJL4oo100lL/8PxBwO5Za99du
         8Ty2JpfGFfrsfKKpgf62SAJcQx4Rwst6frVo7EQvufJxL4H46Kt4zUkuDKxTbOsdZDCv
         xCYospWCh8Q63pTUJB+bDuRrYFwD8L0zksQyKzbkiaPHqbIg2AhcWc9cA2il0NZucjcH
         eo5LQ5kHjDh0zx9MLekz8QHn/0+cwdg721gh5b7M0Z0w39KqjnptCMK0TK5ps2nY7Acn
         rMmrfQEdEjxAAfEqi594KCVHGItgpiPG2CzK/0ASuH0zN/S05GxzBWKuc3okiqnB7y2b
         pkyw==
X-Forwarded-Encrypted: i=1; AL+hErH/VlRZY4y6T1hTDm49lQ0xSP6lnyIytE7yidCCl+0fBpGFiOfBJXp4mUlLfQlYSueJSo0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/yJGqqJCEm9Sf2uX8gdikQDsRIIjBUnPcV5tJOIG8W1/MW/eRR
	uUI2oP+BoAsEAnEu5mNlabj/ROOkPB7dovHjQSNLCCBVUvuHTba3CRw6
X-Gm-Gg: AZFdTZfW10XWM91ahqLokBTAk6C96RSAQMrtHsWlW8nUv+DFUCYcx+vSmLpLeZpdxm/
	HufmxuTI50kd6QIpTVnYor6kN0Ky4zuwcMrD9SaybEgQ2VraWRkzPolqLOvK3Q2m0mn0CAmLeKY
	AO93/uisbepqvlYivAAeJwJwMOchl6+U+77QpruROBsSVsg7njO7txfsNn1CGh415ElKrq2Rv18
	thGScF0Wo5LsaoOWIQLkABV+pXDGsW8fb8SkIcLMTpaHFDQOnysy3yuXKUmUellecuIVEhCAilZ
	M7uVFYmyOC6WB56aQ22la9+iysZ5lCVZLZOCznBhONi3zNNq8nFjZoN72g3Rb3hV5T9/CuTYaJ+
	fGGX4cmsb82E/hCYRqSe6sVDkmRARh7iiCDgX7dFg9bJ0Iklvxg+S42Jj8JpuovXL6bqqh/6g1V
	9EuUQp5kBT+QbW76W9mz/7eFQ1iKzL9FosQIOHA5BCt+g6Z+Qlq/fACZ76mkAXhriYGymjcsN4K
	fEcyi9L0v4Zr+e3DbO7fX1x47g7udnUoplqF9L1c1EnQLj+Vfb10EY2ZvDtDAMc39rS78pEnyfU
	tMilALb9cMfP8de6/D2Puw9gJ8VMtKe0gnfE+4FOjs9LkXcqI4XCTB7hg0hm2edjKs+B/U/v/bR
	5HVVpApkpwiPBCIpri57AMgSNNQvsJIutmAJzoNs=
X-Received: by 2002:a05:693c:42d1:b0:386:b0ea:327d with SMTP id 5a478bee46e88-386b0ea3549mr3926679eec.5.1795474865278;
        Mon, 23 Nov 2026 15:01:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/4] ASoC: arizona: switch to generic device properties
 and clean up
Date: Mon, 23 Nov 2026 15:00:53 -0800
Message-Id: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbFBGsC/3WNyw6CMBBFf4XM2hpaXsrK/zAspnWEMdKaFolK+
 u8WXLs8ybnnLhDIMwVoswU8zRzY2QRql4EZ0PYk+JIYVK5qKfNKoOePsygwOCMMHrXGBgutG0i
 Th6crv7bcuftxeOobmWltrMbAYXL+vf3NcvX+pGcpcqEqMk1RHMqyplM/It/3xo3QxRi/0LmrW
 roAAAA=
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

This series converts Arizona ASoC drivers to generic device properties
and cleans up dead code and formatting issues:

- Convert audio platform data parsing from OF-only APIs to generic
  device property helpers and drop CONFIG_OF guards across the codec
  drivers.
- Parse device properties unconditionally in the jack detection and codec
  drivers even when platform data is supplied, preserving existing
  channel settings and boolean flags when properties are absent.
- Drop unused hpdet_acc_id and hpdet_acc_id_line fields from struct
  arizona_pdata along with the unreachable HPDET accessory ID logic in
  the jack detection driver.
- Clean up coding style and argument alignment in arizona-jack.c.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Only parse and validate wlf,hpdet-channel when the property is present,
  without clobbering existing platform data on absent or invalid values.
- Default an unset (0) hpdet_channel to ARIZONA_ACCDET_MODE_HPL in
  arizona_jack_codec_dev_probe() instead of using the GNU ?: extension
  in arizona_extcon_device_get_pdata().
- Link to v1: https://patch.msgid.link/20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com

---
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 248 ++++++--------------------------------
 sound/soc/codecs/arizona.c        | 121 +++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 113 insertions(+), 325 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

