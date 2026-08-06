Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A89377ECC
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979212; cv=none; b=aVSL4t1Mgc8dCqj3MWRiNbu+xWJd0xSfLmDzisVLwV0qJi6fro4cFxFy2wXepnfwSLq+JBF6WVXW+v/Izl7GYD6HpcyFosIBT6dUCEQYHHG8q2e8HAQTBDp/GtXrizyO5nFNOPZr1ov/0jT4st3pIw3LKrWQ/W+tStWtA7wuHDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979212; c=relaxed/simple;
	bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnTw8P7vn0hgWPocAvZNpk8perZfa+luQDOiuMSSxZx38CwVr2ADAG8xR6jH6/1wYzxJPJ5ZstSjB7cAEu/zG155k09GPrOSZG18zh1qHq50EFAsRb1D0X9oKmf8BjX/prmlAH+WEy0yjyoEXRqdZ3lc48180p0qXn6LcLyKwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwcpAAoL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwcpAAoL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cfff5f88dbso24256755ad.3
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979210; x=1786584010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
        b=ZwcpAAoL3Oh2MBLew8qfn44tmrYdTGEoFQpUvt4vMxhMTNpcFZB8AQChjqyioH57hv
         +RawXsbKDT1gOIiYokXXQ9t86MjuSumT2HpmGXl/ZTLlRknn/PhYa4bTQYSONLLQ6QN/
         T6BgtQotLaNKnKcSUaTyFBqAByItK4mVjuj+kQDXhyVkJOUkEzcovvaik6muIIJn5OYd
         OKmTKn3yBRruqwnKuQQ83wk80Zk6fGxHQ+5GxwWXhQQ5Noa8HMVNKR3QOob5oCcxAJfq
         CcdiAtvUKMJG88nkA5K+f5aOLyVmsIEboBQKWOdw4cN5qXKDTMKX1MvdFe+4ml7OJNuE
         E8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979210; x=1786584010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JbSIdz1Hs55nv8CvNDLovF4817NCnAQbvjf8YGcyOWw=;
        b=OPd/FYQ4EMyZLGT2Xe11hUojdc0e6bSMC3JSaUURRUuPWO0DaOrPfO4cFocy5lxXFL
         8ZCihM7vPWOGpIH0ZWb1rcbPHFgrBqGa2P/mOfKA63ybeCAm2dSr5MUM9f4+ibCoWwhX
         OVK6oDFMjLeXmWcdlx13u3Q+5DrK5mtIqhjS4ijUgogu4uiBnfNStuJPScz29uDQrinK
         QfQRo1l8zj1m0jPIScKawqmZHUeahxilH3l3AywHDYa8dOKUW6r10aRZS8Ih6n9A8CNc
         OBZ5fRO/BGlq9Q7mrvqVNgSP8EjDIxpyeD0Fz6tXf1mB4elKRwq1yQ+QicCtL5exxaEC
         /PSw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo79aPuK0XWA2Ht6Y2tjtCppQ3k68YKLf62bHaFrItEi0TS/nhAL+Cj50/RGJQEXSQHPw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2cI75TgqfRaGlxMd8l+3ep3xpl5DHKYPp6yBc8be3Gn+hz1Gx
	plG0oVN0avMBewKxSYYrRom3+t3gW0YRgwh5M+v5+OcG1qLWnu1eOUqj
X-Gm-Gg: AR+sD13RV9J5E2mUK+DmYY2CD5+whoIJemb+/cPYKzVNWRu66QaSQBRbmpFAlHUoOlG
	Ypqc12aMi3GhldDceCD7f+bpyHELJio4xVCMKkuYsZsz9FWgrhu7P7XLwRQVJPID4aqm2xnmUjo
	bCcrHuKWNbVlgQu9Lz94iQSIW39XmxqqNuZQyj8Xbt351gzYURg6DSvzEpIO33Sc5HFo8F3WWpF
	9fpmHKJe6sU1r6Dx0x+/F/4bGDc5RRRJ8it6sm7rhrmiwZ0tkWine5MjRnLkTOMFEgCekR1QBHr
	ynY3AvbCxaOOjy/Xq7bkIqULnNDUvj0j/i7UNEvJA/zV9liWNtEpV6edii/QDcavqO4GG/+mrFB
	gIjcEcVTsdmo0uj2L4MVMWIifroKr63S9KY6yiJ/7k8S7VNYCiHF+M/BNC6MsH7mI1fVrySY1ee
	0j1XhJP9i+aUWfAaBBxfZ2JVR5p4XWJMiPnGvBdLevhHLNyjifmhJnZgOP1VCAGOK2KB8xdfrfG
	dQXTHK1LFt3B3BCSf4DLZgdWHeFFZ3V0hv7m+n8mJXwPKFUyEAh/GRo/ZKX
X-Received: by 2002:a17:903:1a10:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d0ca767b88mr146173255ad.9.1785979210494;
        Wed, 05 Aug 2026 18:20:10 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa0268b3sm22350915ad.37.2026.08.05.18.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:20:09 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: linux@roeck-us.net
Cc: lee@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	patches@opensource.cirrus.com,
	sre@kernel.org
Subject: Re: [PATCH] mfd: wm8350: propagate ADC read timeout instead of returning 0
Date: Wed,  5 Aug 2026 19:19:50 -0600
Message-ID: <20260806011950.27428-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <04a58bd8-df9e-4c66-ae19-8473d6ab9c41@roeck-us.net>
References: <04a58bd8-df9e-4c66-ae19-8473d6ab9c41@roeck-us.net>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 8/5/26, Guenter Roeck wrote:
> I am not sure if this warrants fixing in a 17+ year old driver,
> unless it is observed to be a real problem. It appears to me that the
> error handling was likely not implemented on purpose.
>
> On top of that, as is seen a lot lately, this fixes a rare issue
> that is likely never going to be seen in the real world while not
> addressing the many real problems in the driver (as reported by Sashiko).

That's fair, sure. The automated review also caught a real regression
in this patch itself: reusing `ret` for the voltage value in the
power_supply get_property callbacks means a successful read returns
a nonzero value instead of 0, which breaks the normal
if (power_supply_get_property(...)) error-checking convention for
callers which is on my end.. I'll drop this patch rather than resubmit a v2 for an issue
you've said isn't worth fixing here.

Thanks,
ivy
