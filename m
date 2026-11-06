Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943580;
	b=0xNTgkpOtsZTMH0Q363b8BZPPzXFmkOeiE385x8QLdDdGc1Utq9mQCMNuNSltmxI32vx
	 5BZUr48pFe5KKowZGJQFt5lyWgNRDDp2CPl1fihPrGqCI5/ruJVZ8BOrdDEj6HKKH10BS
	 1UaN/UuefJok+R/RB9rhKs5898iKIo0hage65djP5yR6a/Z8lkRecv7vSVnHih3nT9V62
	 xWqLI/+lTn4Y4pE5u0yEaJw0x79DdGS5XAiTWtlbjl5QfwEuzO7bhwZR6CfmGadagc2lV
	 mN7Y9YJ69QJE4OPQD1/Y9xFImnnreLBgWLaan0KcLk+XdRzy94qqJF+5ilWgpc9L7zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
	b=O4rKe+7QUvaExMuiOHxzqzGYxvKRTGqK9wir1WglA6Tkglg7MfuZJ+xMMgCZDxJBKa/i
	 xiRNQ87XG+hsJlIzDR39TAwgTXZhK36OhU9mqYhSIbKyt3RyvYjui511eGhhneYZwOOv8
	 M//ZYAdd+4dXzidm9zR/chJmaqpemiQ4aj7WIlF5WSew+cisCupzebs4mmPbaMx/ToYZA
	 VPdNZGdbRM0dIR59essO/aH/uynPN7y4nsS5kw/HJDiwU+9/SggmIsM9qDY/4OcwArJS9
	 V/Ls5BOwangmmAHWqk5UGnU+wAzXnrwSwH4lbXawRAznXyf1wluTnsAnGKeX9EvtuLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw1oAiUh;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBA606A330
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCBA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uw1oAiUh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so478145eec.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 21:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943579; x=1794548379; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=uw1oAiUhx9bF4YiqiOLyY5zUkPGmubahRG+Qsh+eQ8PLpbFVzpZ38paI5ytj99shm6
         ExZdnuYiAHNUW9lCBKS1kxeyDL/aShH7I1B5aiP/2eMLZrvPZqxqTUYY/HFXYLptFAo8
         YKeaSlIOJct393Gp3tQvO4PdRRcZirEsDRzX+1BwhjNWMovnKDv6F7XobwFw5lNgHfiI
         /q5uVS/frA3IsHcjybZvmIG/D8NIRaAf/pgXFeg2PhQtZsyureKV4meBT/ODugttzYvV
         eLE8fvsdgdndtrEJwzPFF/m5tpnRPTKcJF+nZkcZLG9Yn47bsQKuKjFBzNP5BSiGkz7T
         lerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943579; x=1794548379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auWTB7UYaiNGOrSlerkFN1JgXbcgJ8fBYjKO/2KEZoI=;
        b=WzDr3Ga4eiAYoa/IsTSZje/71HrBKCbn+S0zce4nQlq3zHumcEaIjyJisZPCIiIwsz
         B+NpLawreF+6+pq3VX54owWaNFjcuczxqo0S2sdZLkEGYtQU9heK0JjMHh7CvzggSDwv
         eMP4jjssFlAJ2m43nJKq+AhVXc6zvfvNHE/irO8Ji+QX9nSvW8J2JPg1toV/tyU3L9M+
         UAOTR0cPGLuFN0VHj09yQBBJzOPvKVT/sFl/FB0VgcN8PEpEuyXPkXWEPxC6WZKXqrnz
         oZHLo/2Sx9fFqgCRESQw5CWPi7kWQqwvs8Qhe9pZli40Kn7pScIqTU6os1WmLWstc7xf
         2B4g==
X-Forwarded-Encrypted: i=1; AL+hErGlsiMeeTC33zocbVHIPJVYNWMgNUJHPise7wsydohaMcXFenFfGyU4IfqtPCt3faC/W0g=@lists.linux.dev
X-Gm-Message-State: APuU4Z8GBXw6j4LNToXzahOpIRg0oDvuckxG5sjB0BaY1o761g56lbtV
	+L9xS7BbHdWdf7VpaanT94MsjC5av6mTn6TWARLW0kJEXP4d5TKh3pL+
X-Gm-Gg: AYBFou101BmVONlCe1FAHdXoN5ZLHB6JNRqDQwKXyz3pQMG0u4vBo/nmc9S5gvzJa8Y
	W+n/raamMNEd/uOucNtsDhlfPCFvdQqdjp5cE/3HDZVD1NmIDUBKtZAIQLJFhXa10aURILNmxpt
	dkSPux1mlbxG9icMbmL7pV/r/D2OI4iFcIpHkUCSWwRDQdXGERFC2AhF1CpiTvgWOO+k3nSRjdG
	s1faDdQov2tt7JE8pflQmuR+YSbLj9/p1GSkTA0RN8cdNC/Y4emCyJIUzSJTpE0k17LMy2Yx0vW
	hzKci+qPe4mr9cO5XCN7F+BPpDb0ymPUVZlfnf0pDZHzldEwW7co5LhKdsh/RL8GoBFDLTp1/Sn
	EUcl/Raa0gbwi6ewHzVGuYETmqFbVSACQQJHamA3LkJ1yPf1ywtSp7uTelaiB7UP2zYRjBtaY0a
	484VfnJeCZy2OXkZ6aMt+AqA775iUo062ZKDUyJli9QXj1fw1io6cYg7sNfyv6nE0uT5OZq+5Ag
	LKRposjTOokSUdbT0vIpT1RefBHwWgOCzAGwyjaK6FXtiEoFUOkvXKHbj/03p0JbFxamzVd+2s3
	jdKWZuXe3dmojH67PtfWoSRweoeSSP/XBzEyFFzeDpMUiYJUOJSu7cMtiHtggPnPWtmxmOpVkko
	DmXaCAfvJBaOrYY6b+g==
X-Received: by 2002:a05:7300:ea91:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3700d01f2c8mr152037eec.11.1793943578782;
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:38 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ASoC: arizona: switch to generic device properties and
 clean up
Date: Thu, 05 Nov 2026 21:39:31 -0800
Message-Id: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABNo7WoC/yXMMQ7CMAxA0atUnhspCYKIXqVisIMBMyRVTKuKq
 HcnpeMb/q+gXIQVhq5C4UVUcmpwfQfxhenJRu7N4K2/OGfPBot8c0KDmqOJeCXCgCeiAC2ZCj9
 k/e/G22Gd6c3xsz9g235l6/MLcAAAAA==
X-Change-ID: 20261105-arizona-asoc-ca9bba7a3bb7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

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
Dmitry Torokhov (4):
      ASoC: arizona: convert audio pdata parsing to generic device properties
      ASoC: arizona: always parse device properties regardless of platform data
      ASoC: arizona: drop unused HPDET accessory ID support
      ASoC: arizona: clean up coding style and formatting

 include/linux/mfd/arizona/pdata.h |  21 ++--
 sound/soc/codecs/arizona-jack.c   | 225 +++++---------------------------------
 sound/soc/codecs/arizona.c        | 121 ++++++++++----------
 sound/soc/codecs/arizona.h        |   8 +-
 sound/soc/codecs/cs47l24.c        |   8 +-
 sound/soc/codecs/wm5102.c         |   8 +-
 sound/soc/codecs/wm5110.c         |   8 +-
 sound/soc/codecs/wm8997.c         |   8 +-
 sound/soc/codecs/wm8998.c         |   8 +-
 9 files changed, 99 insertions(+), 316 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-arizona-asoc-ca9bba7a3bb7

Thanks.

-- 
Dmitry

