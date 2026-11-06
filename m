Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993575;
	b=rpFX6TrxSCYRmJlFwU+hav+FTOvpVZO/mEbYmsTHCzB5T1SI2KwkBytEGZDJKTeDL21e
	 sWjSgqg0sLNyrTou7hfuIvPajG6sqFhwmdUouVQwcYsmeXHsY8vCmsy0QkATnav5ad1c1
	 UabfdRlEOYzcDs4BbhHkDotnQlAjKMUE03DYhTzk9GajPpHU8FlJuciYFf21JE+Bif1K8
	 sudLHMZ4GYsSWVq7h3e+ibz6FmOamXT79JyKJOaBZDu+YKzj6X8LSkj2qR5rVR/0vYpuz
	 uDhQBO9m5BUyKzd2u0GCpg/QKGlpFpZA4i8ETfWQ3Mh2S8SOtgxm8gYCN687TFWYFww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
	b=j2P531AI6mCkLcY3j5v33mdRJqC5zgREggTiL7aQqCx024dLQaiHq44+dRhCAR+S+rlX
	 uSZ/ycynWPq1bYyzVNacjFWo3MF+ZgwaxCCPJK5lpJHWDJXIgKFqCVGVE1zK65BRiwpus
	 vbgOp0Ko+gLnGlmjt7BY1qIbM9b+U9OcK1G0gm1IiCkj1E08xBj6naBrRlfHcQBGSOdW5
	 DSQmjPolytsXxdjnyEuhyIeW/50Jwvbn2O4sk5CEFmzCqIbtkg6RsR3S5jJ4t16RqWP+N
	 unUI+O/Xs6tLogb/ASFH4sSWkjv5aht3FLHDA7PjBRWB+MlnBknCx3+TgKd5B/HVf5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THN2tRZT;
	arc=none smtp.remote-ip=209.85.208.197
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE320606A326
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE320606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THN2tRZT
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3ab3061668eso4764171fa.1
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993573; x=1794598373; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=THN2tRZTRoNzis+7yyZnuSRk3D+sW+hCeJXyNrFFP5hsON68D1ul3A4MuSEehYfgMe
         E2Td9xKeWzYNiZIX3NGIG49DehMfcH+Nsvty4dxY3dOIE7zy1pchtyQBJS1gWKD/mbL0
         JxdEOcYwlYC5xCUtCyZfrFPekMv5AK3H0ih2B8yKUdMEcdWx2IOWPrW3tcjLpv3J8oAg
         q9VainBzGpmZjqh302iFEG86UsuLa5csKXIuaHomL5JEl4yA3qVEoiBEw3RNnXdT5oS3
         Z7o8wkV9KKK5uVvTwemRdznWcz5eLIybzigj2vHlWHL0IfvEYq18Fy4Y83uY9pfZdiBo
         CkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993573; x=1794598373;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=QTn2qPYPXsN8Q7DF5dbBK1H3sml7uH2Rw/CfVj9gBDRo+kLv0nTh8TU0x5jGgZVulX
         uw/LSI9LFum2gckpI6hOMYtj4YjpCUUQ1G7M+Ua5nyJXSFDhCpoh2ruk1jBoDRCf4a81
         93Rcvz7UylhTeQl61F5JC7qXI0LbV0Szk81i03zPPdmYAezJHDDA2aBVFvBOCwYpMKOZ
         6xxdL7qy/1myqVJBcZdGQ7WBKrW0Trf7L2FQXIykN9ZNQ8N0wAqqVnBFFl1EI2XCqz8a
         wsWCUc+JuxcNio/0GS+FL4wWGxwoH2L0UKuYlmRJNLxy0lPTst0kmjwuzeZL5qyYqoaq
         V7bw==
X-Forwarded-Encrypted: i=1; AL+hErEtG1qrIrKPaw5OL91dLY2PqtoTUek3R4RG91SOdi6VHb8TaMfRmc4bYl9znkmB5u1Hg3o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hSvCujq3iCO+6lRBHeKashVHMu5fKMN0c5iAG5y99gvSsgZhW
	cuUjAHQkabDojzJ+T8mINBvJOdcthKg8LF5u/5wo2qP5CmTHeOQYncJW77fNAE13oi++9cdbGXl
	JDCPcvlXL4g==
X-Received: from ljou21.prod.google.com ([2002:a2e:b815:0:b0:3ac:e012:5784])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:a80a:0:b0:3a9:8762:d77
 with SMTP id 38308e7fff4ca-3ace3028f4dmr14685591fa.6.1793993573005; Fri, 06
 Nov 2026 11:32:53 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:15 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-2-dbalint@google.com>
Subject: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
explicit reserved padding to struct ec_params_pwrmon (2-byte union
alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
as __ec_align2 and __ec_align4 expand to __packed in Linux.

Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header with EC")
Signed-off-by: Daniel Balint <dbalint@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index a7bd69d83522..6d74371c7074 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
 
 struct ec_params_pwrmon {
 	uint8_t cmd;
+	uint8_t reserved;
 	union {
 		uint16_t set_rate;
 		uint8_t channel_id;
@@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
 struct pwrmon_dump_info {
 	uint8_t channel_id;
 	char channel_name[32];
+	uint8_t reserved[3];
 } __ec_align4;
 
 struct ec_response_pwrmon {
-- 
2.56.0.455.g6c5a503b38-goog

