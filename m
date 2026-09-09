Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EB238A701
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 23:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997774; cv=pass; b=gvzWiF5x8u+g3Rqsawq0jTU8Or8p7JxdymIkf6WpS/QfVvnS6OLFu1rA89hMoPp/f/QIAu1alw9LmS91HQGxEWCuP8Al3639l+AGnq3uFVQVWhwUlbBd7JKWxQZnaXIkINHaZsSFu2Ry2fKRzmXpY+7a6W59qDVEs+wSkX4KJdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997774; c=relaxed/simple;
	bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw2KplBI2kMuL+Q+uQLDK7T606B1qdQRMXp8TManqqirnLvWuhwqB+dVvh96B79NRouiwHLZXJZSSOUQvV7zkeEkIl29HSTnzcRcAWfqZa6VA99QXhVwGbyWznuxDFTbz1FwuZ2tK3haFKMgdLRhtayfMIcYXOpNiOifBiD2uuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNBdpv4V; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNBdpv4V"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso8941205e9.2
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 16:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788997771; cv=none;
        d=google.com; s=arc-20260327;
        b=Frwvw6QFGewfe4+N9GX8VhmDFWzu+373gyAATuckIlFmH+Sy2caT5yyTCx/JjPTK8a
         YMHGydd3TqUZz/J9muUQVHZhML3dpE+D97vZ58YgY9PtpvwtPRshlRu0kmmbBs9Eyq6N
         NNMnSKYEGRoJXIksOSIRYjv1zfqVOo4suMp1qWVLjPYELcSyCq5APspeHZVhlFHuY3s3
         vsg3GDy0n2zQ/1dOXWY0BBMsH5ZKrXtpvHPRL/nfooVviRP1nYy5s/HtQX1kU5JPWiZV
         l2UWhGd+irofALWnRoDS4nqJAQf4VlvoWslZazmylde3FKwGB6ZNeeQyGqIG3lrMczbz
         mADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        fh=ZRRKpmRY7NSf8l8UGPFkse4LNMk9KMy2phLAHIz9Emw=;
        b=Oe1Y1yjFquAba7txNJZELz6y4I/jHJIhJM7rNYRP0FNKLt/7t0XS5rqcuRndxiD/Ms
         5AcBXTeEFDrcExM3tXSrLLWqEOJ7M3nUHlw9hFch+u5pSiWLnFIfY2vLbCFwzrjNWSGq
         4kvYE9ixzHzuPxhyUQDmmwDp3FNiCvoWAhbITfvooj7AUL2/zPunAd4QE4HADlfkUlES
         YdlNuKBozn+TuHiXLQH/Ej/aV+gKWgh1Xm6DTRLylhLRMJWVw9YyoyNvuw4xVTaDh8qn
         vF+TuuLEIUCDGtmyKDpa0BrdkJ5U2FBwEgGHj/3pKI3BxC2i+vLhmcnPKvrYYChvDgE+
         KlTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997771; x=1789602571; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        b=lNBdpv4VfynKNguIQjhp/X0FUIcgCGZE4cmHo/fFL5wD+FnLeseY+YXFINxU2RN+iT
         5JF+wy1iVZB+Pf4v64Vb6eXShnfQR03RJ/91fvCRtK3l/4wNGe8m1HFYU35euW2rmalQ
         J91ZGqXv2aDYQN4cbSJ5BirM/Szheqp8I1Dzocle35UdH6yXFMwW6YuTxiUP4MDYeuLd
         oZOIQ4TOHCZNsBd7ZDkfuDOh8ym1f5sdXyfATZ8sV1et+VRR86fWE2MgxxhmcRqdQBMa
         D6sQ32XyXG+PO3HbD4C3G0Fu7zEdZj9gqDfLT3yUxR3QfkIJkAzHeLnVUazRZoRmGZri
         f0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997771; x=1789602571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIWytb9URnMQVfyMlYUEh0bfqxr8LFOLIuxQ9h1oQu4=;
        b=E/Fk38Pf1DBo3S4JVz9KVx5YGTGcrcJjl97Vqlmb+l1HgnyYGW8EOU+sDrKCoSjfwy
         3pTUoPje3DMoC+1Yn0xDEoegKYOTIsiHJAfM9rsmDCLdbNAYesvfKASga8abINx/vfst
         0JhCM61wNsBV/FWIynzN7K8n8tvxSAu6QKsUirb9sLoNfWDQ2W6NGYsYwgUl7/VIN5/R
         PLCLc81/WR3y0RvQU1RrcuL70D7AAtZrcq2g/dTRDtPnot0DELUiDHYJr0ke1MHGgYHR
         M41+xUxJafaX0+74Su+/yPjVvJxXMyHUMqi2bYk7YiV1inoCEYXTnV2tPtfawmz7NMRz
         Mdng==
X-Forwarded-Encrypted: i=1; AKwUvBx6KPBaSo77y/7tpAeuN0GX0tLmlGaWFgF+urhhxsU85oMm/9ruoZ0/ZzxTqMNlJ6QtAA0=@lists.linux.dev
X-Gm-Message-State: AFuF++kVgCZedChtVOsF9uKIZdHmDlB9o9fsppzWQTD40rCkCHS+qBrp
	AUlPXqtwnKAyJK3GcvJ5mbb8B8TNopBJiR2eqaJFdkaN/e9m7w2TK7+Lcte/zI0Cyp6fsYRGihw
	YohlDfXJCQaCm7qWPqYmWcM8wXsCXA+7IurvdULs=
X-Gm-Gg: AYBFou0LYwmGifWV91XZ8+QINvcrlowPCbVEWvFCuBCZHYBHIE1kTLIcWlhzx11A0wn
	vAOFJG/r10DU5ZlBYGMnFV7PZf9o+b6O4ewz4alciFCEUbgVM3bbgelCNw8A15TnXmXXdHxtRsX
	oLwiodNmdGHnZ1pwotxNVb2WpbQFek10lY6xB+aiqz2XQWmw5kfXSQXpYBiXU8Wtv2nA1Zh2fRf
	MZ26V5R2M6sM2ZKb+Cb3IuXqNbqjsr3VSfg7QLWtxI7+dWvZ/IooY2Gow+3eG3sjwcwknh26eVR
	fimQvGrRU71dcjpe7ouRJsAyITRSTQdNtjBpsrb7cfO4sWGkli1MXHHO6HHh8BGRA5xCq8UX0B1
	VYMgBwsh19gA=
X-Received: by 2002:a05:600c:5647:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-49d259138bamr57643145e9.10.1788997771230; Wed, 09 Sep 2026
 16:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
 <20260908193358.E8D4D1F00A3A@smtp.kernel.org> <20260909160123.GD2133376@google.com>
In-Reply-To: <20260909160123.GD2133376@google.com>
From: Eric Anderson <ejona86@gmail.com>
Date: Wed, 9 Sep 2026 16:49:19 -0700
X-Gm-Features: AcwNN1VJoV3v1Odah8Fe7ZJ7tAJmsAS7QKdDGq3DirsVmWFAI2U8jnmFZUFXl5M
Message-ID: <CAFyMnzYZrJDvkk80LrjN+K+goZXroejY=rtkQTbx2eUNqVgueQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:01=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Tue, 08 Sep 2026, sashiko-bot@kernel.org wrote:
> > New issues:
> > - [High] The patch moves the power-off handler to `SYS_OFF_MODE_POWER_O=
FF`, which executes in an atomic context (local interrupts disabled and sec=
ondary CPUs halted). The handler calls `regmap_update_bits()`, which uncond=
itionally attempts to acquire a sleepable regmap mutex, leading to a system=
 deadlock if the mutex is held by a stopped CPU.
>
> Please review, explain or fix the Sashiko review(s).

From my perspctive, my change is a limited revert for a regression,
and the findings were prexisting (before the regression, and still
today with reset). Also, my change is fixing a guaranteed hang, so
even if this could cause a deadlock with non-zero probability, that is
still an improvement over the current code.

Looking into the actual report, without me knowing anything about
anything, it is either not an issue or a widespread problem.
as3722_pm_power_off, atc2603c_do_poweroff/atc2609a_do_poweroff,
syscon_poweroff, max77620_pm_power_off look to have the same pattern
(best as I can tell). The counter examples are rk808_power_off and
odroid_go_ultra_poweroff_prepare which register as _PREPARE, with
odroid_go_ultra also having an explicit comment about the lock.

This is happening in the final acts of shutting down, so it seems the
system should be pretty quiet at this point. If there's a better
approach, I could look into it, but someone would need to provide a
hint as my ability to provide this patch was "make it work like it
used to." Alternatively, the patch could be viewed as a regression
report.
