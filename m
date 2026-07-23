Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6448424F;
	Thu, 23 Jul 2026 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822135; cv=none; b=ZCOjhLH3UEBQzWKFR+rfarbGPuPMjlGH14jypXh46IpdoenVHothN70poJOFKP4OeVnZl0vE6fq2kdQp4m3p0VCwWF0crq/XUPyz0tu+m3R0OOpO04f7/no0pjNYycimlzKJcpgpNeMIpPSu0oMjZBC2s/rL+johuCE9YKR3ek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822135; c=relaxed/simple;
	bh=QTid9VPIA4Ed4fCSJIu4tQ3u1Z+wtFg0xLWdFEmVteA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IWumcAn4PLLkCfVavu5KekbQ8l31qmDatXKo5xN9umADs8AbD0jCrtZyjtW8R9Gvf+vaz7beCo1GUOjcZyYprDJuf1Tjsg6UQxTBdwsD067I34r2dZ9toy8Qvd/0opS6rYB0+NiCcdxF69SVqBBclfvqaDFneTzULzi6Z4pFM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XADEW8h6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XADEW8h6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99751F00A3D;
	Thu, 23 Jul 2026 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822134;
	bh=rpqUOtK8GwhwUKFoy/whvfIuFtOc5TFX3jWisXNO5Tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XADEW8h6QgGkJnhmy/eh/DIH3WGxUqzN4sLsp5c6fe1r7jLCpy85BqRKcbpwpUSf9
	 v+R9ldr0iEufxgtfLbKCd4kKUtIa0Nrq7HqPwglTR8XCsbToU/iYqyOiwuWYVx7W6j
	 nEatCdcolECs9zWnjCHrWh/OuydO++gk3VAtE2zrikaRrFFKuY4D6a4h/kEFrYydgw
	 Epa2wOEWxYMnvBTSS1+wtY9jdZB18nm4jsYgiZ2CTwMii97aNLUDQSYM1NTTRjazl8
	 rIK/lWJWAa/1+BV2GsyY5kBBwW6vaR4ZBNT3y4VLgmIsExR5AF2K/OOdo87kzLp9Wu
	 0YnydfJaPISbQ==
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>
In-Reply-To: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
References: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: si476x-i2c: Get rid of duplicate
 NULL checks
Message-Id: <178482213262.3525228.3337424641297828169.b4-ty@b4>
Date: Thu, 23 Jul 2026 16:55:32 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 15 Jul 2026 21:16:03 +0200, Andy Shevchenko wrote:
> GPIO descriptor APIs are NULL-aware and since the requested line is optional
> we don't need to have an additional check each time we want to toggle GPIO.
> 
> Get rid of duplicate NULL checks.

Applied, thanks!

[1/1] mfd: si476x-i2c: Get rid of duplicate NULL checks
      commit: f1f9a784ced3503fe165a1744dd924b5f73a9088

--
Lee Jones [李琼斯]

