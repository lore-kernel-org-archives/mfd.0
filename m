Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6B2931E1;
	Thu, 16 Jul 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216994; cv=none; b=f41sDTT7X/Bq5Oi1vbpMJFVoBKvmChREYHDoD0IY2kHipXCoGQZr0gxn1fPMYwyHl3qDMWU1k7MzGfJVZ0WKOlav2d9S2y8VePXzdlgCJ/KpJoRihowtXFpzYhOAcmc4vMfnFAIPQB+nl/aKBCyK6uJhSrcq2EktyCuwSSjLj6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216994; c=relaxed/simple;
	bh=UiFzx2cfT91hxAzJ3KA36dW+S8RbIswdYrPtbz8xBNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QlgYna4WimBF5K1ge8Fct+JREL/MK0wUsidtHijgPqB5kg3D6+DYud/Z2XzQy7k9cFWuimSbEM2wtnV6Gc0eTHbWHOrfJ0iKsFhqHmEl2+axftYbhA+m8zSJb5kMFVdUhWjz+8GGYXsViwDS0u2UQw0ZPFhaNhGET7skfJBGw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjrU43o0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjrU43o0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424B51F000E9;
	Thu, 16 Jul 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216993;
	bh=0eqHstVacwSIPczAEE459C4oPczgIgDzF8xkR/dKvsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IjrU43o005kJtlC/qG0MsclCpZBqhENZF3wWokyCXgh5T7jTmZxWrpzRKtdZvs00p
	 PFkBygwB4R8NYwiy4W0Vk6mTKTV3w0Tb9E9q8WAPcmeWB6qAMbHU3lhnfPhoebmMqK
	 RloaLM35vB+4YGoHl8jZHvNR4DLaDuiIwH4pJOaDN08bOuNXUMkhA8c9xxOCBFUwc7
	 JwXftZj4shUjoAiErinWuhleczNEAjswod63dDA5TujciY8jBOAY77jBhNA5Z5PNDE
	 5m9zDIMb8umP6ZbkE/9CZ7j7mC0AdozLuReDfYX2ZkET6mDf0UNDghlTfCyha7ElzM
	 Za05wrba836qQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
Subject: Re: [PATCH v2 0/2] mfd: ucb1x00: Convert Assabet gpio-keys to
 software nodes
Message-Id: <178421699199.1440885.3916746519572063119.b4-ty@b4>
Date: Thu, 16 Jul 2026 16:49:51 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 06 Jul 2026 22:01:29 -0700, Dmitry Torokhov wrote:
> This patch series converts the legacy gpio-keys platform device on the
> StrongARM SA-1100 Assabet evaluation board from platform data to software
> nodes and device properties.
> 
> The first patch registers a shared software node for the UCB1x00 GPIO
> controller in drivers/mfd/ucb1x00-core.c, attaching its firmware node
> directly to the GPIO chip prior to registration. The second patch
> converts the Assabet machine subdriver to define dynamically allocated
> software nodes referencing the UCB1x00 GPIO controller directly, allowing
> pin bindings to be resolved via the attached firmware node without relying
> on name matching.
> 
> [...]

Applied, thanks!

[1/2] mfd: ucb1x00: Register software node for GPIO controller
      commit: ded1b7daab756ab61f5f6f0a3ed7465a106fb60c
[2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use software nodes
      commit: 3a162eca527feb80856da0ab32972d677210237b

--
Lee Jones [李琼斯]

