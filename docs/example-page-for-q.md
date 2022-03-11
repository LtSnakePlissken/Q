# Example page for Q

This page is an example for the maintainers of the documentation and a guide how to use Python Markdown and its extensions with MkDocs for building.

## Before you start

We changed the structure of the navigation as a proposal for improvement. We recommend to create more main navigation items for a better hierarchy.

One other hint regarding the file naming: currently the Markdown documents are named using ` _ ` (underscore) instead of a ` - ` (hyphen).

Here is why you should consider renaming the files:
<ul class="grid gap-sm" style="list-style: none">
  <li>
    <a class="card-v14 flex items-center justify-between padding-sm" href="#0" aria-controls="modal-video-iframe" data-url="https://www.youtube.com/embed/AQcSFsQyct8" role="button">
      <div>
        <p>Underscores vs. dashes in URLs</p>
        <p class="color-contrast-medium text-sm margin-top-xxxxs margin-bottom-0" style="margin: 0">03:40 min – by Google Search Central</p>
      </div>

      <svg class="icon icon--md margin-left-sm" viewBox="0 0 32 32"><g><path d="M16,0C7.178,0,0,7.178,0,16s7.178,16,16,16s16-7.178,16-16S24.822,0,16,0z M23.537,16.844l-11,7 C12.373,23.947,12.187,24,12,24c-0.165,0-0.331-0.041-0.481-0.123C11.199,23.701,11,23.365,11,23V9c0-0.365,0.199-0.701,0.519-0.877 c0.32-0.175,0.71-0.162,1.019,0.033l11,7C23.825,15.34,24,15.658,24,16S23.825,16.66,23.537,16.844z"></path></g></svg>
    </a>
  </li>
</ul>

### The new structure in the mkdocs.yml config:

``` yml
# Navigation config
nav:
    - Introduction:
      - What is Q? : index.md
      - Q onboarding in 5 minutes : five_minutes.md
      - Example intro page: example-page-for-q.md
    - Tutorials:
      - Basic setup:
        - Install and setup MetaMask : how_to_install_metamask.md
        - Use the Q mobile wallet : how_to_install_q_wallet.md
        - Delegate Q to a validator : how_to_delegate_to_validator.md
        - Exercise your governance rights : how_to_exercise_governance_rights.md
        - Become a root node : how_to_become_a_root_node.md
        - Layer 0 governance of root nodes: layer0_governance.md
        - Become an expert in an expert panel : how_to_be_an_expert_in_expert_panel.md
        - Earn extra Q tokens : how_to_earn_extra_Q_tokens.md
        - Obtain a loan against a collateral : how_to_obtain_a_loan_against_a_collateral.md
        - Verify and update the Q constitution: how_to_verify_q_constitution_hash.md
      - Technical how to’s:
        - Setup a Q fullnode : how_to_setup_fullnode.md
        - Setup a validator node : how_to_setup_validator.md
        - Setup the token OmniBridge : how_to_setup_omnibridge.md
        - Interact with smart contracts : how_to_interact_with_smart_contracts_with_remix.md
        - Export private key: how_to_export_key.md
    - Your HQ dApp:
      - Overview:
        - Dashboard: dapp_dashboard.md
        - Governance: dapp_governance.md
        - Q Vault: dapp_qvault.md
        - Consensus Services: dapp_consensusservices.md
        - Saving & Borrowing: dapp_savingborrowing.md
        - Decentralized Auctions: dapp_decentralizedauctions.md
        - Time Locks: dapp_timelocks.md
```

## Special HTML Elements

Yes! it is possible to add HTML directly in the `/docs/*.md` files. It will be rendered perfectly. Please find some examples below:

### Tutorial Videos?

Yes. Videos are also possible. Just change the data-attribute. Opens in a modal.

<ul class="grid gap-sm" style="list-style: none">
  <li>
    <a class="card-v14 flex items-center justify-between padding-sm" href="#0" aria-controls="modal-video-iframe" data-url="https://www.youtube.com/embed/AQcSFsQyct8" role="button">
      <div>
        <p>Underscores vs. dashes in URLs</p>
        <p class="color-contrast-medium text-sm margin-top-xxxxs margin-bottom-0" style="margin: 0">03:40 min – by Google Search Central</p>
      </div>

      <svg class="icon icon--md margin-left-sm" viewBox="0 0 32 32"><g><path d="M16,0C7.178,0,0,7.178,0,16s7.178,16,16,16s16-7.178,16-16S24.822,0,16,0z M23.537,16.844l-11,7 C12.373,23.947,12.187,24,12,24c-0.165,0-0.331-0.041-0.481-0.123C11.199,23.701,11,23.365,11,23V9c0-0.365,0.199-0.701,0.519-0.877 c0.32-0.175,0.71-0.162,1.019,0.033l11,7C23.825,15.34,24,15.658,24,16S23.825,16.66,23.537,16.844z"></path></g></svg>
    </a>
  </li>
  <li>
    <a class="card-v14 flex items-center justify-between padding-sm" href="#0" aria-controls="modal-video-iframe" data-url="https://www.youtube.com/embed/AQcSFsQyct8" role="button">
      <div>
        <p>Underscores vs. dashes in URLs</p>
        <p class="color-contrast-medium text-sm margin-top-xxxxs margin-bottom-0" style="margin: 0">03:40 min – by Google Search Central</p>
      </div>

      <svg class="icon icon--md margin-left-sm" viewBox="0 0 32 32"><g><path d="M16,0C7.178,0,0,7.178,0,16s7.178,16,16,16s16-7.178,16-16S24.822,0,16,0z M23.537,16.844l-11,7 C12.373,23.947,12.187,24,12,24c-0.165,0-0.331-0.041-0.481-0.123C11.199,23.701,11,23.365,11,23V9c0-0.365,0.199-0.701,0.519-0.877 c0.32-0.175,0.71-0.162,1.019,0.033l11,7C23.825,15.34,24,15.658,24,16S23.825,16.66,23.537,16.844z"></path></g></svg>
    </a>
  </li>
  <li>
    <a class="card-v14 flex items-center justify-between padding-sm" href="#0" aria-controls="modal-video-iframe" data-url="https://www.youtube.com/embed/AQcSFsQyct8" role="button">
      <div>
        <p>Underscores vs. dashes in URLs</p>
        <p class="color-contrast-medium text-sm margin-top-xxxxs margin-bottom-0" style="margin: 0">03:40 min – by Google Search Central</p>
      </div>

      <svg class="icon icon--md margin-left-sm" viewBox="0 0 32 32"><g><path d="M16,0C7.178,0,0,7.178,0,16s7.178,16,16,16s16-7.178,16-16S24.822,0,16,0z M23.537,16.844l-11,7 C12.373,23.947,12.187,24,12,24c-0.165,0-0.331-0.041-0.481-0.123C11.199,23.701,11,23.365,11,23V9c0-0.365,0.199-0.701,0.519-0.877 c0.32-0.175,0.71-0.162,1.019,0.033l11,7C23.825,15.34,24,15.658,24,16S23.825,16.66,23.537,16.844z"></path></g></svg>
    </a>
  </li>
</ul>
<!-- modal video -->
<div class="modal modal--is-loading flex flex-center bg bg-opacity-90% padding-x-md js-modal" id="modal-video-iframe">
      <div class="modal__content width-100% max-width-md max-height-100% overflow-auto shadow-md" role="alertdialog" aria-labelledby="modal-video-iframe-title" aria-describedby="">

        <p class="sr-only" id="modal-video-iframe-title">A video is being shown</p>

        <figure class="aspect-ratio-16:9">
          <iframe src="" class="js-modal-video__media" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
        </figure>
      </div>

      <div class="modal__loader" aria-hidden="true">
        <svg class="icon icon--lg color-bg icon--is-spinning">
          <path d="M24,48A24,24,0,1,1,48,24,24.027,24.027,0,0,1,24,48ZM24,4A20,20,0,1,0,44,24,20.023,20.023,0,0,0,24,4Z" opacity="0.4"></path>
          <path d="M48,24H44A20.023,20.023,0,0,0,24,4V0A24.028,24.028,0,0,1,48,24Z"></path>
        </svg>
      </div>

      <button class="reset modal__close-btn modal__close-btn--outer js-modal__close js-tab-focus">
        <svg class="icon icon--sm" viewBox="0 0 24 24">
          <title>Close modal window</title>
          <g fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="3" y1="3" x2="21" y2="21" />
            <line x1="21" y1="3" x2="3" y2="21" />
          </g>
        </svg>
      </button>
    </div>

### Link Cards

<div class="margin-top-md">

            <!-- popular links -->
            <div class="grid gap-sm">

              <a class="card-v14 padding-sm flex flex-column col-6@xs col-6@lg" href="basic-page.html">
                <figure class="card-v14__icon-wrapper margin-bottom-xs color-accent" aria-hidden="true">
                <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#file-text"/>
                </svg>
                </figure>
              
                <h3 class="text-md">Card Title</h3>
                <p class="color-contrast-medium line-height-md margin-y-xs">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente dolorem officia.</p>
                <p class="card-link color-white margin-top-auto">Explore <svg style="margin-bottom:-6px" width="1.25em" height="1.25em" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#arrow-right"/>
                </svg></p>
              </a>

              <a class="card-v14 padding-sm flex flex-column col-6@xs col-6@lg" href="basic-page.html">
                <figure class="card-v14__icon-wrapper margin-bottom-xs color-accent" aria-hidden="true">
                <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#link"/>
                </svg>
                </figure>
              
                <h3 class="text-md">Card Title</h3>
                <p class="color-contrast-medium line-height-md margin-y-xs">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente dolorem officia.</p>
                <p class="card-link color-white margin-top-auto">Explore <svg style="margin-bottom:-6px" width="1.25em" height="1.25em" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#arrow-right"/>
                </svg></p>
              </a>

              <a class="card-v14 padding-sm flex flex-column col-6@xs col-6@lg" href="basic-page.html">
                <figure class="card-v14__icon-wrapper margin-bottom-xs color-accent" aria-hidden="true">
                <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#users"/>
                </svg>
                </figure>
              
                <h3 class="text-md">Card Title</h3>
                <p class="color-contrast-medium line-height-md margin-y-xs">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente dolorem officia.</p>
                <p class="card-link color-white margin-top-auto">Explore <svg style="margin-bottom:-6px" width="1.25em" height="1.25em" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#arrow-right"/>
                </svg></p>
              </a>

              <a class="card-v14 padding-sm flex flex-column col-6@xs col-6@lg" href="basic-page.html">
                <figure class="card-v14__icon-wrapper margin-bottom-xs color-accent" aria-hidden="true">
                <svg width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#gitlab"/>
                </svg>
                </figure>
              
                <h3 class="text-md">Card Title</h3>
                <p class="color-contrast-medium line-height-md margin-y-xs">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Sapiente dolorem officia.</p>
                <p class="card-link color-white margin-top-auto">Explore <svg style="margin-bottom:-6px" width="1.25em" height="1.25em" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round">
                    <use xlink:href="/assets/img/feather-sprite.svg#arrow-right"/>
                </svg></p>
              </a>
              
            </div>

            <!-- getting started -->
            <div class="margin-top-xl padding-bottom-lg">
              <h2 class="margin-bottom-lg">Getting Started</h2>
              <p>This is an eye-catchy list which can be modified to demonstrate the simple process of getting started (just an example).</p>

              <ol class="list-v2 list-v2--ol">
                <li>
                  <div class="margin-bottom-xs">
                    <h4 class="list-v2__title">
                      <div class="list-v2__bullet"></div>Read the docs</h4>
                  </div>

                  <div class="list-v2__content">
                    <div class="text-component">
                      <p class="">Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio voluptatum rerum repudiandae nobis quae, autem minima eius doloribus recusandae minus?</p>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="margin-bottom-xs">
                    <h4 class="list-v2__title">
                      <div class="list-v2__bullet"></div>Ask the community</h4>
                  </div>

                  <div class="list-v2__content">
                    <div class="text-component">
                      <p class="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Expedita eum tempora maxime, praesentium veritatis consectetur quia laudantium pariatur.</p>
                      <p class="">Lorem ipsum dolor sit amet consectetur <a href="#0">adipisicing elit</a>. Sapiente unde explicabo natus consequuntur laborum dolores, asperiores sint, eveniet deserunt porro illum aut ab earum non ducimus, cumque nam qui minima itaque ipsam ad esse. Atque architecto molestiae assumenda inventore dignissimos.</p>
                    </div>
                  </div>
                </li>

                <li>
                  <div class="margin-bottom-xs">
                    <h4 class="list-v2__title">
                      <div class="list-v2__bullet"></div>Start building</h4>
                  </div>

                  <div class="list-v2__content">
                    <div class="text-component margin-bottom-md">
                      <p class="">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt natus totam deleniti corporis cupiditate non aperiam adipisci quasi repellendus possimus.</p>
                    </div>

                    <div>
                      <a class="btn btn--primary" href="tutorials.html">Tutorials →</a>
                    </div>
                  </div>
                </li>
              </ol>
            </div>
            <!-- end main content -->
          </div>

### Accordion

Perfect solution for structuring frequently asked questions or any other content.

<div class="grid max-width-adaptive-md margin-y-lg">

        <ul class="accordion js-accordion" data-animation="on" data-multi-items="off">

          <li class="accordion__item js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Send, receive and earn Q</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>Sending and receiving Q is easy. To install a Q wallet, go <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/metamask" target="_blank">here</a>. Q token holders are rewarded for their role in governing Q. To learn how you can earn extra income with Q, go <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/interest" target="_blank">here</a>.</p>
                </div>
              </div>
            </div>
          </li>
        
          <li class="accordion__item  js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Become a validator node</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>Validator nodes play a vital part in Q’s consensus mechanism. They validate transactions. In return they receive rewards. Find detailed instructions on how to set up a validator node <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/validator" target="_blank">here</a>.</p>
                </div>
              </div>
            </div>
          </li>
        
          <li class="accordion__item  js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Become a root node</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>Root nodes are the guardians of the Q Constitution. They are an integral part of Q’s governance framework. Interested in becoming a root node? Start <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/root" target="_blank">here</a>.</p>
                </div>
              </div>
            </div>
          </li>
        
          <li class="accordion__item  js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Build applications on Q</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>Q enables developers to program smart contracts and build decentralized applications. You can use the Solidity programming language. To start developing with Q, go <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/remix" target="_blank">here</a>.</p>
                </div>
              </div>
            </div>
          </li>
        
          <li class="accordion__item  js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Participate in Q’s governance</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>As a Q token holder, you are an active participant in the system. You can propose changes and vote on proposals submitted by others. To learn how to participate in Q’s governance, go <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/governance" target="_blank">here</a>.</p>
                </div>
            </div>
          </li>
        
          <li class="accordion__item  js-accordion__item">
            <button class="reset accordion__header padding-y-md js-tab-focus" type="button">
              <h4 class="">Become a Q expert</h4>
        
              <svg class="icon accordion__icon-plus no-js:is-hidden" viewBox="0 0 16 16" aria-hidden="true">
                <g class="icon__group" fill="none" stroke="currentColor" stroke-miterlimit="10">
                  <line x1="1" y1="8" x2="15" y2="8" />
                  <line x1="1" y1="8" x2="15" y2="8" />
                </g>
              </svg>
            </button>
        
            <div class="accordion__panel js-accordion__panel">
              <div class="text-component padding-top-xxxs padding-bottom-md">
                <div class="padding-top-0 overflow-hidden col-10@sm">
                  <p>Q Experts support Q by setting system parameters. Do you have relevant knowledge and skills? If so, volunteering as a Q expert might be a great role for you. Start <a class="link-subtle" href="https://www.reddit.com/r/QBlockchain/wiki/tutorials/experts" target="_blank">here</a>.</p>
                </div>
              </div>
            </div>
          </li>
        
        </ul>

    </div>


### Highlighting & Badges

Important text passages can be <mark>highlighted with a little help of the `<mark>` HTML tag.</mark> We also have badges which can be used: This is a text with <span class="badge badge--success text-sm align-baseline">Inline Badge</span> applied.

## Admonitions

Admonitions, also known as call-outs, are an excellent choice for including side content without significantly interrupting the document flow. Material for MkDocs provides several different types of admonitions and allows for the inclusion and nesting of arbitrary content.

!!! note "Important Note"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa. :material-close:

I am just some text in between …

!!! note--error "Error"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

I am just some text in between …

!!! note--success "Success"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

I am just some text in between …

!!! note--warning "Warning Simple"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

I am just some text in between …

!!! note--warning "<span class='flex margin-bottom-xs color-warning' aria-hidden='true'><svg width='24' height='24' fill='none' stroke='currentColor' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'><use xlink:href='/assets/img/feather-sprite.svg#alert-triangle'/></svg><span class="margin-left-sm">Complex notes with icon …</span></span>"

    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et euismod
    nulla. Curabitur feugiat, tortor non consequat finibus, justo purus auctor
    massa, nec semper lorem quam in massa.

## Tables

A markdown table is follwing:

| **Method**  | **Description** | **Status** |
| :---------- | :-------------- | ---------: |
| `null`    | Delete resource | <span class="badge badge--note text-sm">Note</span> |
| `PUT`       | Update resource | <span class="badge badge--success text-sm">Success</span> |
| `GET`       | Fetch resource  | <span class="badge badge--error text-sm">Error</span> |
| `DELETE`    | Delete resource | <span class="badge badge--warning text-sm">Warning</span> |


## Lists

### Ordered Lists

1.  Vivamus id mi enim. Integer id turpis sapien. Ut condimentum lobortis
    sagittis. Aliquam purus tellus, faucibus eget urna at, iaculis venenatis
    nulla. Vivamus a pharetra leo.

    1.  Vivamus venenatis porttitor tortor sit amet rutrum. Pellentesque aliquet
        quam enim, eu volutpat urna rutrum a. Nam vehicula nunc mauris, a
        ultricies libero efficitur sed.

    2.  Morbi eget dapibus felis. Vivamus venenatis porttitor tortor sit amet
        rutrum. Pellentesque aliquet quam enim, eu volutpat urna rutrum a.

        1.  Mauris dictum mi lacus
        2.  Ut sit amet placerat ante
        3.  Suspendisse ac eros arcu

### Unordered Lists

- Nulla et rhoncus turpis. Mauris ultricies elementum leo. Duis efficitur
  accumsan nibh eu mattis. Vivamus tempus velit eros, porttitor placerat nibh
  lacinia sed. Aenean in finibus diam.

    * Duis mollis est eget nibh volutpat, fermentum aliquet dui mollis.
    * Nam vulputate tincidunt fringilla.
    * Nullam dignissim ultrices urna non auctor.

### Definition Lists

Follow is an a tag

:   Lorem Ipsum was machen sachen

**Lorem ipsum dolor sit amet**

:   Sed sagittis `eleifend` rutrum. Donec vitae suscipit est. `Nullam tempus`
    tellus non sem sollicitudin, quis rutrum leo facilisis.

**Cras arcu libero**

:   Aliquam metus eros, pretium sed nulla venenatis, faucibus auctor ex. Proin
    ut eros `sed sapien ullamcorper` consequat. Nunc ligula ante.

    Duis mollis est eget nibh volutpat, fermentum aliquet dui mollis.
    Nam vulputate tincidunt fringilla.
    Nullam dignissim ultrices urna non auctor.

Das hier ist wieder normaler Text