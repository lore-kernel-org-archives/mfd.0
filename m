Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8623F3876C9
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575845; cv=none; b=hqjwcNGJZHrb/Zm6u3132zsMAMU/vQU1iZbWYh7htcz5xFGcD4MlOabadsPg2+I1f0JWYrN1Vsa4j5Vcftzta3CnbINYTYMsHl2OQZxfdWqx/wCjRX1kPwbJrBrATaymY9K4v3dNNhpAZ9EEWbddfSAiWBnjfD2rLUB0tooqb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575845; c=relaxed/simple;
	bh=5Ryp3d7aqLnvpRz5v4IsdKzMUbgNqjT3Ro3X7cbHVoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JLEzs7jYFpWnzixCO/93E0vhEWySFoBnrk1XU02A+zR1DF1I3AtVUMMcdLLYnkDsYkYmCnLlKd8f7UN3gPUlLwKqd47C+9d59FCT3kdR6uT2gS+hcpJYXf1KPJ1arq6P26FJVzBHabAK4q9PxSTRmJQ548Libv4QuBY58JAD8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1tXI83f; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1tXI83f"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1140779e87.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575835; x=1790180635; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xB8EAnJUgMIUT/rcIvi4yd7X9aPkcPd8GSdLDXa2lks=;
        b=k1tXI83fwzn0pcPCPgg3+h+LHme91EyrcBu4O30cb8ROYVRgVVDnsiI0vHnilPxMGS
         c4i11fifMyuCGC5q3APSMujEEp82K55BTREcLQ6gWIh4nD8Z9XVyy7pkNsCi8cVV7HyE
         XdtnE+VvPcm7xcEnP0E4jJPFSkjEELc2eU70Dsp48VqjoQpnir2UQ2VMC7qKMiQqAVql
         gaudYGnworNFTbhEcjgspdEl9WZYbjrWP4tS5rfr8YqZwFJ2aTjiQxS7+4zUEfMwkq2F
         CPXImVi8wuw9EghOywa2vnhmjB9bI5jE6v8JxXmakPBVtpkFlZnSWJqIVOJCJt3T8dUV
         rKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575835; x=1790180635;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xB8EAnJUgMIUT/rcIvi4yd7X9aPkcPd8GSdLDXa2lks=;
        b=SPGkyBOdyIEA49xcQNTfHOa0/RHFGrCuOhEq+/dqQ5nD0zNhiGNqWeOrckJf158XqG
         wBphw2Rb2QJaS8bBRvyzkkOXr0nEksDV0g9dbKJUyfpF4yn5YquXkaqbnI6UCB7Z7uc7
         /DpxEgLHfDhJwxrjsII151SpdTLSARPxMScV6R5NRtwXUB2apeVGbpIGoFsWcKFn3upU
         FziWrRvNHXZ1P3H30KkMYVUw+ExEumS+4BbJPkLSUwyidlkbTD8KJbWJ83YoPYIY0xR0
         WdCGXEX7YBmFqJH/GSK7LEV5wDYKX1eIluIlGMGPCA4Gq5KDrCCxF7GdXD6MY9BiXRUf
         ScfQ==
X-Gm-Message-State: AFuF++kGDMVLndOEtU74RxQfwFvRIkzbacuTRN+XDP9st7lc9DsuHzmZ
	3gv0r/FGVxAfb5FTEAn/bUhhcGd0dVTHNuUaxp/ET567HP1ZJWm2NWw=
X-Gm-Gg: AYBFou1hRk+NNP1q5nUCPBJWNxlIpah8Z6vfY7f54kW4vrQt+Co+6Kl2m84K8B8+9Kj
	YFv7RTfi8tRszzb5PYcjPJybhstbx9vrTz31YWAG/hMAISoOkjJWNchESpHahVgsUsVNq2aKzQD
	F1nYWKgyRUcWb3vOraXsxXEEyDq8tEpitc7ncekKf2YP/PdYKlSsXcuw5B2AdU24kM+dQjPTYE1
	St/9Tp2V+yjpcS9eD4qrVbuToQ7apnBsrvgWlEVfg/jPvYFmODq2tQU08EdxaJnzHUAf94IdhHc
	jlgb8ba/nu50yeDCIdmDyHdL5qaNeKYQRkb/zeybTfk3miSS5vUFFb/Bpqf+ahTM+i0PA0jQqm2
	MErWYQCQpQtGx1e1RP9CRvkyZdr20whlnUC7WpU6I4Qnc2gfev8mbFNKVDKwscoVZZC9+Kr7UYg
	ldG9F1h64UOFuXuarAmEBmi5ID9KOCUJIGbJe42QM9qF03RlLYqTUj3Pn2dm0bMOqHIR4fzV+iW
	uiFstbeNGfKMABiKOAxSuMz
X-Received: by 2002:a05:6512:2347:b0:5b7:6393:ebf3 with SMTP id 2adb3069b0e04-5b8b6652835mr968622e87.33.1789575834744;
        Wed, 16 Sep 2026 09:23:54 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:23:53 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Subject: [PATCH v7 0/4] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Date: Wed, 16 Sep 2026 21:23:46 +0500
Message-Id: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJLCqmoC/4XOTWrDMBAF4KsEraui0Z+lrnqPkoUkzzgCxw5Wa
 lKC714lK+OGevkezPfmzgpOGQv7ONzZhHMueRxqaN4OLJ3C0CHPbc1MCmmFB8XzcMWe95dSeIv
 xu6PCkUgZJ1qQ3rB6eJmQ8u2Jfh1rPuVyHaef58YMj/ZfbgYO3CmVYrRElPxndw65f0/jmT24W
 e4TshIBgqZAJiWrtoTaJ1QlIDqUEUh4L7eEXhP6JaErITA6iaFJgH++MGvCviRMJeq4N2SUFrb
 ZEnafsFxwkwBcSFoJbNfEsiy/ejEm5gMCAAA=
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=5Ryp3d7aqLnvpRz5v4IsdKzMUbgNqjT3Ro3X7cbHVoQ=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKX/R8Gh8XJxvxzUHwXR6r0nrh1q5SwHBRp5
 LPJXhf8FWCJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrClwAKCRAT637qmaOf
 okV7D/9Qb7/d0U6GpEkWR33Ti83noI/IPwqnhRMZ53A0PkIHbL6L9fT+oDq+CPH82/pfp/gUIe7
 ECGdjVxPv8DztPv6wxvUSunoucQUD4OtwuOm7OSiGvmPgEcfoxRIqMZS7tf2i+mLGhewXfsPpx2
 LACvjI0Oyhyn0UsLaTplRv8TngxTHizKGkXE+9QQuRALukrc6fMv1orq+Tp/3GK+Ibc5C6dG5K8
 ifaBtP7LLa82z5z6KglYXNYXyM/kBr+a4y/z3UkpTVmZgQevmjY74Xst2r7ZfscGLNtAQMxcpxp
 kMmov2gyZDGB4X72CjnukyUWOaoWClz/XfAOOMwlkyrs1YENtv7Q/1UD9PHtt9tfi9blZuHdUVt
 kNLfytCg9BOm42BZTwD0+jFSUO3VjN/yvbfj2cT1t2rNcQ0pkezFhQh1vDEpUNuSqBtIK+rhkRT
 fEdTUu0RU1IYUGoteqAME0wYv5Uye3DfON0LbjvLw6xPdiKicsmGVn1wgxNW38HU+E6Lgicb/6X
 EVUqO5E+luoD8ba4Dd1zAojjz4ZrQ/ewoKumVbSuaULTGW+9ukVGjO1t5ZLE+lpQ6wWcaWF0Svp
 VUaYwbBOijG5uxWQWch689BvFAi9wbYXk1RIk4Xqv/BsgnC4EM7yTU3bapSgpXpOiCSogEj7fc7
 iwad+MUUj1BRqqA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

This series cleans up DebugFS code, modernizes it by replacing
obsoleted macros and removes redundant error checking.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v7:
- The final corrections after review.
- Link to v6: https://lore.kernel.org/r/20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com

Changes in v6:
- Split each logical change into an individual patch.
- Link to v5: https://lore.kernel.org/r/20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com

Changes in v5:
- Changed the goal of the patch to DebugFS modernization.
- Refactored intel_lpss_debugfs_add() into a void function.
- Removed deprecated macros and functions.
- Removed dmesg message completely.
- Link to v4: https://lore.kernel.org/r/20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com

Changes in v4:
- Keep the dmesg messages, instead check whether DebugFS is initialized
- Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com

---
Maria Lisina (4):
      mfd: intel-lpss: Remove redundant DebugFS error check
      mfd: intel-lpss: Use plain octal values for file permissions
      mfd: intel-lpss: Remove extra DebugFS dentry
      mfd: intel-lpss: Switch to debugfs_remove()

 drivers/mfd/intel-lpss.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)
---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>

